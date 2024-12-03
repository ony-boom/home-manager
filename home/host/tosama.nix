{
  pkgs,
  stablePkgs,
  ...
}: {
  nixGL.defaultWrapper = "mesa";
  useWayland = true;

  programs = {
    waybar = {
      settings = {
        mainBar = {
          "hyprland/workspaces" = {
            persistent-workspaces = {
              HDMI-A-1 = 2;
            };
          };
        };
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = stablePkgs.hyprland;
  };

  home.packages = with pkgs; [
    (config.lib.nixGL.wrap stremio)
  ];
}
