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
        shell = mkDefaultApp ["zsh" "fish" "nu"] "nu";
      };
    };
    default = {
      terminal = "ghostty";
      shell = "zsh";
    };
    description = "Default applications to be used across the system.";
  };
}
