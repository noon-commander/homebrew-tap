# Rendered by .github/workflows/release.yml into Formula/noon-commander.rb of the tap
# (ADR 0014); edit this template, never the formula in the tap.
class NoonCommander < Formula
  desc "Terminal file manager focused on seamless local and SFTP file operations"
  homepage "https://github.com/noon-commander/noon-commander"
  # Homebrew allows no `url` in `on_arm` or `on_intel` blocks.
  if Hardware::CPU.intel?
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.2.0/noon-commander-0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "519748d5e0a286dffce61f6dd8a57a64287d5ce9b2dde2ebf0640126364f6769"
  else
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.2.0/noon-commander-0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "eaddb4f4fd62d0f6f563bb710af627314799319f337409957d069c75eb51e7b5"
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
