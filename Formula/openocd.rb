class Openocd < Formula
  desc "On-chip debugging, in-system programming and boundary-scan testing"
  homepage "https://openocd.org/"

  head do
    url "https://github.com/raspberrypi/openocd.git", branch: "rp2040"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "texinfo" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "libusb"

  def install
    ENV["CCACHE"] = "none"

    system "./bootstrap"
    system "./configure", "--disable-werror",
                          "--enable-picoprobe",
                          "--prefix=#{prefix}"
    system "make", "-j4"
    system "make", "install"
  end
end
