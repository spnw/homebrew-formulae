class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/spnw/mpc-bar"
  url "https://github.com/spnw/mpc-bar/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "3a998e1b6f0b16b0e13efe26ca2061a8d86831bfabf99551a6784d3d5f96436e"
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
