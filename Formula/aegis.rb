class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  url "https://registry.npmjs.org/@getaegis/cli/-/cli-0.9.3.tgz"
  sha256 "b73ff30a7ebf6142312809bd40cc25d4a2e7a8b8b9c4b5634093ff3502272007"
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
