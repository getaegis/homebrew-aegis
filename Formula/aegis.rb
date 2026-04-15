class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  license "Apache-2.0"
  version "1.0.3"

  depends_on "node@24"

  on_macos do
    on_arm do
      url "https://github.com/getaegis/aegis/releases/download/v1.0.3/aegis-1.0.3-darwin-arm64.tar.gz"
      sha256 "9326af18d392b618f845e6f9bf193dec82245b7d3d410104e3f97245a68e5262"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/getaegis/aegis/releases/download/v1.0.3/aegis-1.0.3-linux-x64.tar.gz"
      sha256 "0704cd2262a5616bb07c9504aaa14a15751422c85921157840009b0da5dc0135"
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
