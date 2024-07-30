{
  pkgs,
  config,
  lib,
  self,
  ...
}: let
  nixGL = import (self + /nix/nixGL.nix) {inherit pkgs config lib;};
in {
  home.packages = with pkgs; [
    (nixGL.wrap vlc)
  ];
}
