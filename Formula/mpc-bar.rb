class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/spnw/mpc-bar"
  url "https://github.com/spnw/mpc-bar/archive/refs/tags/v0.4.tar.gz"
  sha256 "4cfd370050ba82a79dc137488d29db1b4c7dc9eed76bf238ac9bd41cc9b79ea0"
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
