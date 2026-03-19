class Rt < Formula
  desc "Remote terminal accessible from your phone via QR code"
  homepage "https://github.com/rafgirao/homebrew-rt"
  url "https://github.com/rafgirao/homebrew-rt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "986b3b1201747cbf9fad3b564948bb13cfdfc15783bccd16f74c68c2e23f9e41"
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
      Run the interactive setup to install a tunnel provider:
        rt setup

      Then start a session:
        rt [session-name]
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/rt help")
  end
end
