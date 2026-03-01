class Tiksave < Formula
  desc "Download TikTok videos without watermarks from the command line"
  homepage "https://github.com/miftahganzz/homebrew-tiksave-cli"
  url "https://github.com/miftahganzz/homebrew-tiksave-cli/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "dab564b04d0c865f6549e5d2f863f43bdc829001cb4f4af6f1bd74c95c5a1872"
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
