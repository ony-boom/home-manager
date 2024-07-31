{
  pkgs,
  config,
  lib,
  self,
  ...
}: let
  nixGL = import (self + /nix/nixGL.nix) {inherit pkgs config lib;};
in {
  programs.kitty = {
    enable = true;
    theme = "Everforest Dark Medium";
    package = nixGL.wrap pkgs.kitty;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
