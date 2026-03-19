class Cli < Formula
  desc "Remote terminal accessible from your phone via QR code"
  homepage "https://github.com/rafgirao/homebrew-remote-terminal"
  url "https://github.com/rafgirao/homebrew-remote-terminal/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "247d079640dbb6dc0bd1a5b791740916037b753273e2c709d2537a21e6e96d93"
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
