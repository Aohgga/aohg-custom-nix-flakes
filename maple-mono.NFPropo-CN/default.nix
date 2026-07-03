{stdenv, fetchzip} :

stdenv.mkDerivation {
  pname = "maple-mono.NFPropo-CN";
  version = "1.0.0";
  src = fetchzip {
    url = "https://github.com/Aohgga/maple-font/releases/download/v1776757239/MapleMono-NF-CN.zip";
    hash = "sha256-qUDQD8+iy7k7JDsKT5rbk5eCGO9cUfMxZtIERm00kHo=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
