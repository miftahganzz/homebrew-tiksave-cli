class Tiksave < Formula
  desc "Download TikTok videos without watermarks from the command line"
  homepage "https://github.com/miftahganzz/tiksave-cli"
  url "https://github.com/miftahganzz/tiksave-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "82ecb76807b093314e46268f7491a1ee5a65c584f65a1da945a6bd163abb400d"
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
