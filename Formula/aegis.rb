class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  license "Apache-2.0"
  version "1.0.4"

  depends_on "node@24"

  on_macos do
    on_arm do
      url "https://github.com/getaegis/aegis/releases/download/v1.0.4/aegis-1.0.4-darwin-arm64.tar.gz"
      sha256 "b6916ba37ac64cfc2d0682c1383361ed23eb63bbaaa27516a0be8b0f3658dc4e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/getaegis/aegis/releases/download/v1.0.4/aegis-1.0.4-linux-x64.tar.gz"
      sha256 "4fa6a2be99c2518a5a42d232c565176311c790961026ce30238e31443000945f"
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
