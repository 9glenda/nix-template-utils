{ config
, lib
, pkgs
, ...
}:
let
  inherit (lib) mkOption types;

  # The schema of the treefmt.toml data structure.
  configSchema = {
    templates = mkOption {
      type = types.attrsOf (types.submodule [
        {
          path = mkOption {
            description = "Path to the template folder.";
            type = types.path;
          };
          # excludes = mkOption {
          #   description = "List of files to exclude for formatting. Supports globbing. Takes precedence over the includes.";
          #   type = types.listOf types.str;
          #   default = [ ];
          # };
        }
      ]);
      default = { };
      description = "Declare templates.";
    };
  };

  # configFormat = pkgs.formats.toml { };
in
{
  options = {
    settings = configSchema;
  };
  config = {
    # devShell = pkgs.mkShell {
    #   nativeBuildInputs = [ config.build.wrapper ] ++ (lib.attrValues config.build.programs);
    # };
  };
}
