let
  currentTheme = "rose-pine";
in {
  programs.waybar = {
    enable = true;
    settings = import ./settings.nix;
  };

  xdg.configFile."waybar/style.css".source = ./css/style.css;
  xdg.configFile."waybar/${currentTheme}.css".source = ./css/${currentTheme}.css;
}
