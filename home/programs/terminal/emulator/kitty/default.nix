{
  pkgs,
  config,
  lib,
  self,
  ...
}: let
  nixGL = import (self + /lib/nixGL.nix) {inherit pkgs config lib;};
  icon = pkgs.fetchurl {
    url = "https://github.com/rose-pine/kitty/blob/main/icons/terminal.app@2x.png?raw=true";
    hash = "sha256-Y7W9ucwrHrnUREIlO8TCoJLic7oQIeEejMz2TRWWkKM=";
  };
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

  xdg.configFile."kitty/kitty.app.png".source = icon;
}
