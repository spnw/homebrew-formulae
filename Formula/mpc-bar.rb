class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/spnw/mpc-bar"
  url "https://github.com/spnw/mpc-bar/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "659896dbf95d8911c7ebe037dff3ff40e0734938a38d18228558cabd1f56bd59"
  license "GPL-2.0-or-later"
  head "https://github.com/spnw/mpc-bar.git", branch: "main"

  depends_on "libmpdclient"
  depends_on "lua"

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
