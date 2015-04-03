class Libosinfo < Formula
  homepage "https://libosinfo.org/"
  url "https://fedorahosted.org/releases/l/i/libosinfo/libosinfo-0.2.11.tar.gz"
  sha256 "bb6ba136756b26045ba3ed9b3c1b0920a639dd80b007769a1df356d8e2fe0921"

  depends_on "pkg-config" => :build
  depends_on "intltool" => :build
  depends_on "gobject-introspection" => :build

  depends_on "check"
  depends_on "libxml2"
  depends_on "libsoup-with-gnome" => "with-gobject-introspection"

  patch :DATA # remove unknown linker option: --no-undefined

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--enable-introspection",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
__END__
diff --git a/configure b/configure
index 01b764d..22f7d15 100755
--- a/configure
+++ b/configure
@@ -14694,7 +14694,7 @@ case "$host" in
     ;;

   *)
-    NO_UNDEFINED_FLAGS="-Wl,--no-undefined"
+    NO_UNDEFINED_FLAGS=""
     VERSION_SCRIPT_FLAGS=-Wl,--version-script=
     `ld --help 2>&1 | grep -- --version-script >/dev/null` || \
       VERSION_SCRIPT_FLAGS="-Wl,-M -Wl,"