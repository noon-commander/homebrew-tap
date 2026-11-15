# Rendered by .github/workflows/release.yml into Formula/noon-commander.rb of the tap
# (ADR 0014); edit this template, never the formula in the tap.
class NoonCommander < Formula
  desc "Terminal file manager focused on seamless local and SFTP file operations"
  homepage "https://github.com/noon-commander/noon-commander"
  # Homebrew allows no `url` in `on_arm` or `on_intel` blocks.
  if Hardware::CPU.intel?
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.3.2/noon-commander-0.3.2-x86_64-apple-darwin.tar.gz"
    sha256 "cb4845e830643aa1b4c18476002f83b72f1bdb004a98613fa06c72d19b8c1190"
  else
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.3.2/noon-commander-0.3.2-aarch64-apple-darwin.tar.gz"
    sha256 "42d8b132d2cd536adfe2756c19dcd371e7fca0caaf6e799c42411d70ed916d6b"
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
