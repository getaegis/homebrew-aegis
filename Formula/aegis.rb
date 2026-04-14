class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  license "Apache-2.0"
  version "1.0.2"

  depends_on "node@24"

  on_macos do
    on_arm do
      url "https://github.com/getaegis/aegis/releases/download/v1.0.2/aegis-1.0.2-darwin-arm64.tar.gz"
      sha256 "b0c3891880539cca14601bc8d8fbcd5a0a59ed9427f73a3889207025c4642e6d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/getaegis/aegis/releases/download/v1.0.2/aegis-1.0.2-linux-x64.tar.gz"
      sha256 "90d8a8ee660c7a57e3e95da834d59dba9a305616b27c812e71b6e3b298ca7b17"
    end
  end

  def install
    libexec.install "dist", "node_modules", "package.json"

    # Create wrapper script that uses Homebrew's Node.js
    node = Formula["node@24"].opt_bin/"node"
    (bin/"aegis").write <<~EOS
      #!/bin/bash
      exec "#{node}" "#{libexec}/dist/cli.js" "$@"
    EOS
  end

  test do
    assert_match "Aegis", shell_output("#{bin}/aegis --help")
  end
end
