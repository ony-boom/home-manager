{
  lib,
  config,
  # pkgs,
  ...
}: {
  config = lib.mkIf config.wayland.windowManager.hyprland.enable {
    xdg.configFile."hypr".source = ./hypr;

    # home.packages = with pkgs; [
    # ];
  };
}
