{
  pkgs,
  self,
  config,
  lib,
  ...
}: let
  nixGL = import (self + /nix/nixGL.nix) {inherit pkgs config lib;};
in {
  imports = [
    ./rofi.nix
  ];

  xdg.configFile."picom".source = ./picom;

  home.packages = with pkgs; [
    dex
    nitrogen
    nwg-look
    (nixGL.wrap picom-pijulius)
  ];
}
