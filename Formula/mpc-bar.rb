class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/spnw/mpc-bar"
  url "https://github.com/spnw/mpc-bar/archive/refs/tags/v0.1.tar.gz"
  sha256 "c0ac959f364c5bd158f7feae094d3cc274c9d47c5d90f52e3804dea26be70fe8"
  license "MIT"
  head "https://github.com/spnw/mpc-bar.git", branch: "main"

  def install
    system "make", "BINDIR=#{bin}", "install"
  end

  depends_on "libmpdclient"

  service do
    run opt_bin/"mpc-bar"
    keep_alive true
  end

  test do
    assert_match "MPC Bar "+version.to_s, shell_output("#{bin}/mpc-bar -v")
  end
end
