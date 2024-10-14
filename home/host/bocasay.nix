{
  gpuType = "intel";

  wayland.windowManager.hyprland.enable = true;
  programs.kitty.settings = {
    linux_display_server = "x11";
  };
}
