class Tiksave < Formula
  desc "Download TikTok videos without watermarks from the command line"
  homepage "https://github.com/miftahganzz/homebrew-tiksave-cli"
  url "https://github.com/miftahganzz/homebrew-tiksave-cli/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "7570a7c88ac785dd9a74170f029e2e6b2416c8d42c95565edadf4b661f52a97a"
  license "Proprietary"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/tiksave"
  end

  test do
    assert_match "TikSave CLI", shell_output("#{bin}/tiksave --version")
  end
end
