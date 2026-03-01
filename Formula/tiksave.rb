class Tiksave < Formula
  desc "Download TikTok videos without watermarks from the command line"
  homepage "https://github.com/miftahganzz/homebrew-tiksave-cli"
  url "https://github.com/miftahganzz/homebrew-tiksave-cli/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "c763fe697999e90052f3260d4888bcba6ada6e1815a299b308782586f10cc403"
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
