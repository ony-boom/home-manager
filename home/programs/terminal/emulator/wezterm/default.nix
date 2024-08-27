{
  self,
  pkgs,
  config,
  lib,
  ...
}: let
  nixGL = import (self + /nix/nixGL.nix) {inherit pkgs config lib;};
in {
  programs.wezterm = {
    enable = true;
    package = nixGL.wrap pkgs.wezterm;
  };

  xdg.configFile."wezterm".source = ./config;
}
