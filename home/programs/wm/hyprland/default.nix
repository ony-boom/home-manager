{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.wayland.windowManager.hyprland.enable {
    xdg.configFile."hypr".source = ./hypr;
  };
}
