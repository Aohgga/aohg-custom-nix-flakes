{stdenv, fetchzip} :

stdenv.mkDerivation {
  pname = "maple-mono.NFPropo-CN";
  version = "7.9";
  src = fetchzip {
    url = "https://github.com/Aohgga/maple-font/releases/download/v1776757239/MapleMono-NF-CN.zip";
    hash = "sha256-6+iDNzfmurCYG2pD4UtusrAjukHgGwyUlHvk1Ybv+eo=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
