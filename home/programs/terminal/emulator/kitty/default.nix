{
  pkgs,
  config,
  lib,
  self,
  ...
}: let
  nixGL = import (self + /nix/nixGL.nix) {inherit pkgs config lib;};
  themes = {
    everforest = {
      dark = {
        medium = "Everforest Dark Medium";
      };
    };
    rose-pine = {
      dark = {
        default = "Rosé Pine";
      };
    };
  };
in {
  programs.kitty = {
    enable = true;
    package = nixGL.wrap pkgs.kitty;
    theme = themes.everforest.dark.medium;
    extraConfig = builtins.readFile ./kitty.conf;
  };

  xdg.configFile."kitty/tab_bar.py".source = ./tab_bar.py;
}
