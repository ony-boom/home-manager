{lib, ...}: let
  mkDefaultApp = choices: default:
    lib.mkOption {
      type = lib.types.enum choices;
      default = default;
      description = "Default ${default} application.";
    };
in {
  options.defaultApps = lib.mkOption {
    type = lib.types.submodule {
      options = {
        terminal = mkDefaultApp ["ghostty" "kitty"] "ghostty";
        # browser = mkDefaultApp [ "firefox" "chromium" ] "firefox";
      };
    };
    default = {
      terminal = "ghostty";
    };
    description = "Default applications to be used across the system.";
  };
}
