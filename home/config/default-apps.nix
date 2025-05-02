{lib, ...}: {
  options.defaultApps = lib.mkOption {
    type = lib.types.submodule {
      options = {
        terminal = lib.mkOption {
          type = lib.types.enum ["ghostty" "kitty"];
          default = "ghostty";
          description = "Default terminal emulator.";
        };
      };
    };
    description = "Default applications to be used across the system.";
  };
}
