{
  gpuType = "intel";

  programs.hyprland.enable = true;
  programs.kitty.settings = {
    linux_display_server = "x11";
  };
}
