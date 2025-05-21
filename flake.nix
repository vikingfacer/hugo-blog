{
  description = "hugo flake";
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = (import nixpkgs) { inherit system; };
      in rec {
        devShells.default = pkgs.mkShell { packages = with pkgs; [ hugo ]; };
      });
}
