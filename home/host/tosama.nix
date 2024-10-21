{
  lib,
  config,
  pkgs,
  self,
  stablePkgs,
  ...
}: let
  nixGL = import (self + /lib/nixGL.nix) {inherit pkgs config lib;};
in {
  gpuType = "nvidia";
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
    (nixGL.wrap stremio)
  ];
}
