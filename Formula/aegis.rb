class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  url "https://registry.npmjs.org/@getaegis/cli/-/cli-0.8.0.tgz"
  sha256 "2a61de164ce3a1b78a4ec4e585233b553b670ee86cd60f0c43c14d2c7b95154e"
  license "Apache-2.0"

  depends_on "node@24"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Aegis", shell_output("#{bin}/aegis --help")
  end
end
