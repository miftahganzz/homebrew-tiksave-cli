class Tiksave < Formula
  desc "Download TikTok videos without watermarks from the command line"
  homepage "https://github.com/miftahganzz/homebrew-tiksave-cli"
  url "https://github.com/miftahganzz/homebrew-tiksave-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "435085bf86f0e466cb151b59f6ed7a47cf81c60eeb162bb52715c2d86cd3dcc8"
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
