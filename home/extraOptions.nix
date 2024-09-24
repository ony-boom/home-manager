{lib, ...}: {
  options = {
    gpuType = lib.mkOption {
      type = with lib.types; enum ["intel" "nvidia"];
      description = "Which gpu host use";
      default = "nvidia";
    };

    isNixOS = lib.mkOption {
      type = with lib.types; bool;
      description = "If using NixOS";
      default = false;
    };

    programs.hyprland.enable = lib.mkEnableOption "Hyprland";
  };
}
