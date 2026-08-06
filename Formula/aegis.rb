class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  license "Apache-2.0"
  version "1.0.5"

  depends_on "node@24"

  on_macos do
    on_arm do
      url "https://github.com/getaegis/aegis/releases/download/v1.0.5/aegis-1.0.5-darwin-arm64.tar.gz"
      sha256 "03cd55641972a36cd05fb0f6003f71d03d156971e6f4e2019946e58a8b51986b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/getaegis/aegis/releases/download/v1.0.5/aegis-1.0.5-linux-x64.tar.gz"
      sha256 "d4a478cfb09605810f6be5d84602dc7de193d5d384f20b2cf52a94aadd3ca10a"
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
