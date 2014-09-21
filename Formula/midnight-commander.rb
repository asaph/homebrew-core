require 'formula'

class MidnightCommander < Formula
  homepage 'http://www.midnight-commander.org/'
  url 'http://ftp.midnight-commander.org/mc-4.8.13.tar.xz'
  mirror 'ftp://ftp.osuosl.org/pub/midnightcommander/mc-4.8.13.tar.xz'
  sha256 '36d6191a47ec5d89d3788e48846fb620c481816441ff25264add8898d277b657'

  bottle do
    sha1 "7b5b58bbf0cbb0dbb5466e9389549de7de7b7e02" => :mavericks
    sha1 "1c2f103e0e920a41af53fcacc315dc28e5089560" => :mountain_lion
    sha1 "97a5c81e713a32966a62292252cfba29c4044e76" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'openssl' if MacOS.version <= :leopard
  depends_on 's-lang'
  depends_on 'libssh2'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--without-x",
                          "--with-screen=slang",
                          "--enable-vfs-sftp"
    system "make install"
  end
end
