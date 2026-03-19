class Cli < Formula
  desc "Remote terminal accessible from your phone via QR code"
  homepage "https://github.com/rafgirao/remote-terminal"
  url "https://github.com/rafgirao/remote-terminal/releases/download/v0.6.0/remote-terminal-0.6.0.tar.gz"
  sha256 "b9c1cda15ce46d5758a6f247588dbab9cdea88f803802ddd366747117451ed58"
  license "MIT"

  depends_on "tmux"
  depends_on "ttyd"
  depends_on "caddy"
  depends_on "qrencode"
  depends_on "python@3"
  depends_on :macos

  def install
    bin.install "bin/rt"
    (share/"rt").install Dir["share/rt/*"]
  end

  def caveats
    <<~EOS
      Start a session with:
        rt
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/rt help")
  end
end
