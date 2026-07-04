{stdenv, fetchzip} :

stdenv.mkDerivation {
  pname = "otf-apple-pingfang";
  version = "3.0.1";
  src = fetchzip {
    url = "https://github.com/witt-bit/applePingFangFonts/releases/download/3.0.1/pingFang-20.0d4e1.tar.gz";
    hash = "sha256-6+iDNzfmurCYG2pD4UtusrAjukHgGwyUlHvk1Ybv+eo=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/opentype

    runHook postInstall
  '';
}
