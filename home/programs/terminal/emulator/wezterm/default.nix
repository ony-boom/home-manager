{
  self,
  pkgs,
  config,
  lib,
  ...
}: let
  nixGL = import (self + /lib/nixGL.nix) {inherit pkgs config lib;};
in {
  programs.wezterm = {
    enable = true;
    package = nixGL.wrap pkgs.wezterm;
  };

  xdg.configFile."wezterm".source = ./config;
}
