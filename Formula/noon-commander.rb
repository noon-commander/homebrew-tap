# Rendered by .github/workflows/release.yml into Formula/noon-commander.rb of the tap
# (ADR 0014); edit this template, never the formula in the tap.
class NoonCommander < Formula
  desc "Terminal file manager focused on seamless local and SFTP file operations"
  homepage "https://github.com/noon-commander/noon-commander"
  # Homebrew allows no `url` in `on_arm` or `on_intel` blocks.
  if Hardware::CPU.intel?
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.3.1/noon-commander-0.3.1-x86_64-apple-darwin.tar.gz"
    sha256 "e74f86c38ceabbdc2f3c6cadf4dba705e3269746f890e4c2b68927ed1ba8e36b"
  else
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.3.1/noon-commander-0.3.1-aarch64-apple-darwin.tar.gz"
    sha256 "b1fbd8f9f230c5eb57fd462ba5aa33bac92e88dfa2063c049dbab8259308f2c3"
  end
  license "GPL-3.0-or-later"

  depends_on :macos

  def install
    bin.install "noc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/noc --version")
  end
end
