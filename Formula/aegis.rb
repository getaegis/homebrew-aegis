class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  url "https://registry.npmjs.org/@getaegis/cli/-/cli-0.9.5.tgz"
  sha256 "bbab4d5afe1b287a502918ccdd80d1eb4f18b53d7467aeb4b7726cedfdfae248"
  license "Apache-2.0"

  depends_on "node@24"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["\#{libexec}/bin/*"]
  end

  test do
    assert_match "Aegis", shell_output("\#{bin}/aegis --help")
  end
end
