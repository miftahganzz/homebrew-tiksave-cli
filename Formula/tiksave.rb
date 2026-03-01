class Tiksave < Formula
  desc "Download TikTok videos without watermarks from the command line"
  homepage "https://github.com/miftahganzz/homebrew-tiksave-cli"
  url "https://github.com/miftahganzz/homebrew-tiksave-cli/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "1cac801d7d897bded8d6db910d2ca79cd4bb2dc004db3c0482f06f2bbaebc97a"
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
