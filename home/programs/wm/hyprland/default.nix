{
  wayland.windowManager.hyprland = {
    settings = {};
		extraConfig = builtins.readFile ./hyprland.conf;
  };
}
