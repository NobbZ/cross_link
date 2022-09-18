{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  inputs.nobbz.url = "github:nobbz/nixos-config?ref=main";

  outputs = {
    self,
    nixpkgs,
    nobbz,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    npkgs = nobbz.packages.x86_64-linux;
    spkgs = self.packages.x86_64-linux;

    callPackage = pkgs.lib.callPackageWith (pkgs // npkgs // spkgs);
  in {
    inherit (nobbz) formatter;
    devShells.x86_64-linux.default = callPackage ./.nix/shell.nix {};
    packages.x86_64-linux = {
      inherit (import ./.nix/beams.nix pkgs) erlang elixir;
      yamlfmt = callPackage ./.nix/yamlfmt.nix {};
    };
  };
}
