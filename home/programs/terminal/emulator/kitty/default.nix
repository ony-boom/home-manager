{
  pkgs,
  config,
  ...
}: let
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
    enable = config.defaultApps.terminal == "kitty";

    package = pkgs.nixGL pkgs.kitty;

    themeFile = themes.rose-pine.dark.default;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
