{ pkgs }: 
let 
  inherit pkgs;
  mkFolderFromDrv = { drv }: (import ./mkFolderFromDrv.nix) { inherit pkgs drv; };
  lib = {
    inherit
    mkFolderFromDrv
    ;
  };
in 
lib
