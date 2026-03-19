class Rt < Formula
  desc "Remote terminal accessible from your phone via QR code"
  homepage "https://github.com/rafgirao/rt"
  url "https://github.com/rafgirao/rt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "17228e085dd1235219247f67f8d0dce30e8ab4e760a0298cd8bebb842316fed2"
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
      To use rt, just run:
        rt [session-name]

      Dependencies not installed by Homebrew (install one):
        - ngrok:       brew install ngrok
        - cloudflared: brew install cloudflared

      For best experience, add to your ~/.tmux.conf:
        set -g window-size largest
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/rt help")
  end
end
