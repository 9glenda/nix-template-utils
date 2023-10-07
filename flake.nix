{
  description = "A flake utility library to craft templates.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      eachSystem = lib.genAttrs
        [
          "aarch64-darwin"
          "aarch64-linux"
          "x86_64-darwin"
          "x86_64-linux"
        ];
    in
    {
      lib = import ./.;

      flakeModule = ./flake-module.nix;
    };
}
