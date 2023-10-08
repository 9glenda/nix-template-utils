{
  description = "Flake utils demo";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    template-utils.url = "github:9glenda/nix-template-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils, template-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    let 
      pkgs = nixpkgs.legacyPackages.${system}; 
      rs-drv = pkgs.stdenv.mkDerivation rec {
        pname = "folder-from-drv";
        version = "0.1.0";
        src = ./lib;
        nativeBuildInputs = with pkgs; [
          cargo
        ];
        buildPhase = ''
          cargo new cargo-project
          rm -rf cargo-project/.git
        '';
        installPhase = ''
          mkdir -p "$out"
          cp -r cargo-project/* "$out"
        '';
      };
      template-utils-lib = template-utils.lib pkgs;
    in

      {
        templates = {
          rust = {
            path = import (template-utils-lib.mkFolderFromDrv rs-drv);
            description = ''
              rust templates
            '';
          };
        };

      }
    );
}
