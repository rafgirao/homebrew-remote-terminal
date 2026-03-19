class Rt < Formula
  desc "Remote terminal accessible from your phone via QR code"
  homepage "https://github.com/rafgirao/homebrew-rt"
  url "https://github.com/rafgirao/homebrew-rt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "462b971ac058a24403369e2c8aaaa80b4db50f56a6c7b8e3be599db43688e4bd"
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
