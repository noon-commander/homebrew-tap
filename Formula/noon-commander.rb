# Rendered by .github/workflows/release.yml into Formula/noon-commander.rb of the tap
# (ADR 0014); edit this template, never the formula in the tap.
class NoonCommander < Formula
  desc "Terminal file manager focused on seamless local and SFTP file operations"
  homepage "https://github.com/noon-commander/noon-commander"
  # Homebrew allows no `url` in `on_arm` or `on_intel` blocks.
  if Hardware::CPU.intel?
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.3.0/noon-commander-0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "28ed24a6c54c5de5dcf7d370e16922706c7a978155fa3a9990ad4546e0448236"
  else
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.3.0/noon-commander-0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "f967abcd49d9fbb619b1d7e0cee7ecd3a04740daab75caccc15d0ac4eae5a612"
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
