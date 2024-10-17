{stablePkgs, ...}: {
  gpuType = "intel";

  wayland.windowManager.hyprland = {
    enable = true;
    package = stablePkgs.hyprland;
  };
  programs.kitty.settings = {
    linux_display_server = "x11";
  };
}
