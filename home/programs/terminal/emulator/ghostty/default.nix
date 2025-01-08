{
  config,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.nixGL pkgs.ghostty;

    settings = {
      theme = "rose-pine";

      window-padding-y = 10;
      window-padding-x = 12;
      window-decoration = false;
      gtk-single-instance = true;

      background-opacity = 0.8;
      font-family = config.fonts.fontconfig.defaultFonts.monospace;
    };
  };
}
