{
  pkgs,
  config,
  lib,
  self,
  ...
}: let
  nixGL = import (self + /lib/nixGL.nix) {inherit pkgs config lib;};
in {
  home.packages = with pkgs; [
    playerctl
    (nixGL.wrap vlc)
  ];
}
