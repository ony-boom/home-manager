{
  pkgs,
  config,
  nixGLWrap,
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

    package = nixGLWrap {
      pkg = pkgs.kitty;
      inherit config;
    };

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
