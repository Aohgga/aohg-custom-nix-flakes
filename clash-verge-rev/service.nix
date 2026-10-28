{
  rustPlatform,
  fetchFromGitHub,
  meta,
  procps,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "clash-verge-service-ipc";
  version = "2.7.6";

  src = fetchFromGitHub {
    owner = "clash-verge-rev";
    repo = "clash-verge-service-ipc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-4YFRonC0nYuh16djiXuZszSoH06x49RVrtLcBnsI7VI=";
  };

  cargoHash = "sha256-2/lFfhP2414iiH+zG2TvNy6uaCzDldoo7sIfhKrQaFg=";

  buildFeatures = [
    "standalone"
  ];

  nativeCheckInputs = [
    procps
  ];
  # build test helper binaries for tests
  preCheck = ''
    cargo build --features=standalone,test
  '';
  checkFeatures = [
    "standalone"
    "test"
    "client"
  ];
  inherit meta;
})
