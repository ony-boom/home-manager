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

    useWayland = lib.mkOption {
      type = with lib.types; bool;
      description = "If using wayland";
      default = true;
    };

    programs.hyprland.enable = lib.mkEnableOption "Hyprland";
    programs.chrome.enable = lib.mkEnableOption "Google chrome";
  };
}
