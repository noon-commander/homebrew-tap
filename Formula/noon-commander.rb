# Rendered by .github/workflows/release.yml into Formula/noon-commander.rb of the tap
# (ADR 0014); edit this template, never the formula in the tap.
class NoonCommander < Formula
  desc "Terminal file manager focused on seamless local and SFTP file operations"
  homepage "https://github.com/noon-commander/noon-commander"

  if Hardware::CPU.intel?
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.1.0/noon-commander-0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "213681c75a043bc82fd5536b2e5169e6f223450e9eb3f02a8446db8eba1dd9ce"
  else
    url "https://github.com/noon-commander/noon-commander/releases/download/v0.1.0/noon-commander-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "d3d1531f4157f8ae2011a8365c216516ead43b47acf34023b80d042795535259"
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
