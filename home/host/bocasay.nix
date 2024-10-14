{
  gpuType = "intel";

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitors = [];
    };
  };
  programs.kitty.settings = {
    linux_display_server = "x11";
  };
}
