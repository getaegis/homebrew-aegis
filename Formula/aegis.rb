class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  url "https://registry.npmjs.org/@getaegis/cli/-/cli-0.9.1.tgz"
  sha256 "0dbff69e5dc3cf039453b4f2460b897e843ab264db79021ca56c6d549d87e7a5"
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
