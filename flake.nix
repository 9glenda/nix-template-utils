{
  description = "Nix template utilits";
  inputs = {
    nixpkgs = "github:NixOS/nixpkgs/unstable";
  };

  outputs = { self }: {
    lib = { pkgs }: import ./lib.nix {
      inherit pkgs;
    };
  };
}
