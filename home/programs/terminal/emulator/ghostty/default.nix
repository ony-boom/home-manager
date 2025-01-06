{
  config,
  ...
}: {
  programs.ghostty = {
    enable = true;

    settings = {
      font-size = 12;
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
