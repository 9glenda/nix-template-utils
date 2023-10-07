{ self, lib, flake-parts-lib, ... }:
let
  inherit (flake-parts-lib)
    mkPerSystemOption;
  inherit (lib)
    mkOption
    types;
in
{
  options = {
    perSystem = mkPerSystemOption
      ({ config, self', inputs', pkgs, system, ... }: {
        options.template-utils = mkOption {
          description = ''
            Project-level template-utils configuration

            By default template-utils will set the `templates.<system>` attribute of the flake,
            used by the `nix init -t` command.
          '';
          type = types.submoduleWith {
            modules = (import ./.).all-modules pkgs;
          };
        };
        config = {
          # checks = lib.mkIf config.treefmt.flakeCheck { treefmt = config.treefmt.build.check config.treefmt.projectRoot; };
          # formatter = lib.mkIf config.treefmt.flakeFormatter (lib.mkDefault config.treefmt.build.wrapper);
          templates = config.settings.templates;
        };
      });
  };
}
