class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/spnw/mpc-bar"
  url "https://github.com/spnw/mpc-bar/archive/refs/tags/v0.2.tar.gz"
  sha256 "c1d79ca072a1b0b2d334b996d3f28f930e4b89bd48aebc4c0588245c07a48b22"
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
