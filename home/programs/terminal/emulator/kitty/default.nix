{
  pkgs,
  config,
  lib,
  self,
  ...
}: let
  nixGL = import (self + /lib/nixGL.nix) {inherit pkgs config lib;};
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
    theme = themes.rose-pine.dark.default;
    extraConfig = builtins.readFile ./kitty.conf;
  };

  # xdg.configFile."kitty/tab_bar.py".source = ./tab_bar.py;
}
