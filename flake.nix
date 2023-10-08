{
  description = "Nix template utilits";
  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self }: {
    lib = { pkgs }: import ./lib.nix {
      inherit pkgs;
    };
  };
}
