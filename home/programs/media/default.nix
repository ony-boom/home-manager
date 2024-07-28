{
  pkgs,
  config,
  lib,
  ...
}: let
  nixGL = import ../../../nix/nixGL.nix {inherit pkgs config lib;};
in {
  home.packages = with pkgs; [
    (nixGL.wrap vlc)
  ];
}
