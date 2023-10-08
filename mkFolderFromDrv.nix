{ pkgs, drv }:
let
in
pkgs.stdenv.mkDerivation rec {
  pname = "folder-from-drv";
  version = "0.1.0";
  src = "${drv}";
  installPhase = ''
    mkdir -p "$out/files"
    cp .* * -r "$out/files"
    printf '"%s"' "$out/files" > "$out/default.nix"
    '';
}
