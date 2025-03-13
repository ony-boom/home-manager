{
  config,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.nixGL pkgs.ghostty;

    settings = {
      theme = "dark:Builtin Solarized Dark,light:Builtin Solarized Light";

      window-padding-y = 10;
      window-padding-x = 12;
      window-decoration = false;
      gtk-single-instance = true;
      gtk-titlebar = false;

      background-opacity = 0.8;
      font-family = config.fonts.fontconfig.defaultFonts.monospace;
      shell-integration-features = "sudo";

      keybind = [
        "ctrl+shift+r=reload_config"
        "ctrl+up=goto_split:up"
        "ctrl+down=goto_split:down"
        "ctrl+left=goto_split:left"
        "ctrl+right=goto_split:right"
      ];
    };
  };
}
