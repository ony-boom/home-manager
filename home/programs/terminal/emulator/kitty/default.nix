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
        medium = "everforest_dark_medium";
      };
    };
    rose-pine = {
      dark = {
        default = "rose-pine";
      };
    };
  };
in {
  programs.kitty = {
    enable = true;
    package = nixGL.wrap pkgs.kitty;
    themeFile = themes.rose-pine.dark.default;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
