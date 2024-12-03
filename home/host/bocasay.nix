{
  stablePkgs,
  pkgs,
  self,
  lib,
  config,
  ...
}: let
  nixGL = import (self + /lib/nixGL.nix) {inherit pkgs config lib;};
in {
  gpuType = "intel";
  useWayland = false;

  programs = {
    waybar = {
      settings = {
        mainBar = {
          "hyprland/workspaces" = {
            persistent-workspaces = {
              eDP-1 = 2;
            };
          };
        };
      };
    };
  };

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

  home.packages = with pkgs; [
    (nixGL.wrap stremio)
  ];
}
