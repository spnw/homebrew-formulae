class MpcBar < Formula
  desc "Menu bar client for the Music Player Daemon"
  homepage "https://github.com/spnw/mpc-bar"
  url "https://github.com/spnw/mpc-bar/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "f8ffd9d04558bc5e85b48829ea7866d10e295bbb8f2529a387411978d695d57d"
  license "GPL-2.0-or-later"
  head "https://github.com/spnw/mpc-bar.git", branch: "main"

  depends_on "libmpdclient"
  depends_on "lua@5.4"

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
