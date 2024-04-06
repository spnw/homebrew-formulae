class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/spnw/mpc-bar"
  url "https://github.com/spnw/mpc-bar/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "f9addef2e523448d9182209aef319c862fc8e927f0290a6cba8987e604c77f89"
  license "MIT"
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
