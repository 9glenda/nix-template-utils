{ self, lib, flake-parts-lib, ... }:
let
  inherit (flake-parts-lib)
    mkPerSystemOption
    mkSubmoduleOptions;
  inherit (lib)
    mkOption
    types;
in
{
  options = {
    flake = mkSubmoduleOptions {
      formatter = mkOption {
        # type = types.lazyAttrsOf types.package;
        type = types.submoduleWith {
          modules = (import ./.).all-modules;
        };
        default = { };
        description = ''
          An attribute set of per system a package used by [`nix fmt`](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-fmt.html).
        '';
      };
    };


    # perSystem = mkPerSystemOption
    #   ({ config, self', inputs', pkgs, system, ... }: {
    #     options.template-utils = mkOption {
    #       description = ''
    #         Project-level template-utils configuration

    #         By default template-utils will set the `templates.<system>` attribute of the flake,
    #         used by the `nix init -t` command.
    #       '';
          # type = types.submoduleWith {
          #   modules = (import ./.).all-modules pkgs;
          # };
    #     };
    #     config = {
    #       # checks = lib.mkIf config.treefmt.flakeCheck { treefmt = config.treefmt.build.check config.treefmt.projectRoot; };
    #       # formatter = lib.mkIf config.treefmt.flakeFormatter (lib.mkDefault config.treefmt.build.wrapper);
    #       # templates = config.template-utils.settings.templates;
    #       # packages.default = pkgs.hello;
    #       # templates = {
    #       #   default = {
    #       #     path = "./templates/rust";
    #       #   };
    #       # };
    #     };
    #   });
  };
}
