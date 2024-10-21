{stablePkgs, ...}: {
  gpuType = "intel";

  wayland.windowManager.hyprland = {
    enable = true;
    package = stablePkgs.hyprland;

    settings = {
      monitor = [
        "eDP-1, 1920x1080@60.05600, 0x0, 1"
        "HDMI-A-1, 1366x768@59.79000, 1920x0, 1"
      ];
    };
  };
}
