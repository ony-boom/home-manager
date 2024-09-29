{
  lib,
  config,
  pkgs,
  self,
  ...
}: let
  nixGL = import (self + /lib/nixGL.nix) {inherit pkgs config lib;};
in {
  gpuType = "nvidia";
	useWayland = false;

  home.packages = with pkgs; [
    (nixGL.wrap stremio)
  ];
}
