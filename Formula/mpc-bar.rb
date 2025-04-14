class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/spnw/mpc-bar"
  url "https://github.com/spnw/mpc-bar/archive/refs/tags/v0.3.tar.gz"
  sha256 "96935dcbabab83877fb7e442d52f55d25972b69db4a707d68542007b32f1930e"
  license "GPL-2.0-or-later"
  head "https://github.com/spnw/mpc-bar.git", branch: "main"

  depends_on "libmpdclient"

  def install
    system "make", "BINDIR=#{bin}", "install"
  end

  service do
    run opt_bin/"mpc-bar"
    keep_alive true
  end

  test do
    assert_match "MPC Bar "+version.to_s, shell_output("#{bin}/mpc-bar -v")
  end
end
