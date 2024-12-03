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
    enable = true;
    package = config.lib.nixGL.wrap pkgs.kitty;
    themeFile = themes.rose-pine.dark.default;
    /*
       settings = {
      shell = "${pkgs.nushell}/bin/nu";
    };
    */
    extraConfig = builtins.readFile ./kitty.conf;
  };
  xdg.configFile."kitty/sessions".source = ./sessions;
}
