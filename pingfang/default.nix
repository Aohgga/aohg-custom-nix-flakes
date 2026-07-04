{stdenv, fetchzip} :

stdenv.mkDerivation {
  pname = "otf-apple-pingfang";
  version = "3.0.1";
  src = fetchzip {
    url = "https://github.com/witt-bit/applePingFangFonts/releases/download/3.0.1/pingFang-20.0d4e1.tar.gz";
    hash = "sha256-M8vBp41XIQLEv8ZNArRbZg7fwECVk5rYolfU4/Eh5T4=";
    stripRoot = true;
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 * -t $out/share/fonts

    runHook postInstall
  '';
}
