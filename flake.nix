{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  inputs.nobbz.url = "github:nobbz/nixos-config?ref=main";

  outputs = {
    self,
    nixpkgs,
    nobbz,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    npkgs = nobbz.packages.x86_64-linux;

    beams = import ./.nix/beams.nix pkgs;

    callPackage = pkgs.lib.callPackageWith (pkgs // npkgs // beams);
  in {
    inherit (nobbz) formatter;
    devShells.x86_64-linux.default = callPackage ./.nix/shell.nix {};
  };
}
