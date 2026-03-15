class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  url "https://registry.npmjs.org/@getaegis/cli/-/cli-0.9.4.tgz"
  sha256 "cfdfb76173c004d8599db0589ed6ca6c348a70ed1c1a3f0d72676c24a0ec208a"
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
