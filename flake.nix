{
  description = "Aohg's custom nix-flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    nixpkgs,
    ...
  }:
  let
    supportedSystems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    packages = forAllSystems (
      system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in {
        maple-mono.NFPropo-CN = pkgs.callPackage ./maple-mono.NFPropo-CN {};
        otf-apple-pingfang = pkgs.callPackage ./pingfang {};
        yaru = pkgs.callPackage ./yaru {};
        clash-verge = pkgs.callPackage ./clash-verge-rev {};
      }
    );
  };
}
