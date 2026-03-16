class Aegis < Formula
  desc "Credential isolation for AI agents"
  homepage "https://github.com/getaegis/aegis"
  url "https://registry.npmjs.org/@getaegis/cli/-/cli-0.9.7.tgz"
  sha256 "4e0afad5e3cbbc29bcb10c5ac4e70f4f8ffc01ac6e362e0c4ecaec72c6291f8a"
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
