{
  description = "Aohg's custom nix-flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let 
    forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" "i686-linux" "aarch64-linux" ];
    in {
    packages = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages."${system}";
      in {
        maple-mono.NFPropo-CN = pkgs.callPackage ./maple-mono.NFPropo-CN {};
      });
    };
}
