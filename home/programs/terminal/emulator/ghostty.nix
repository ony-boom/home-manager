{
  config,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = config.defaultApps.terminal == "ghostty";
    package = pkgs.nixGL pkgs.ghostty;

    settings = {
      command = config.defaultApps.shell;
      theme = "dark:catppuccin-mocha,light:catppuccin-latte";

      window-padding-y = 10;
      window-padding-x = 12;

      # just for title bar to look good
      gtk-titlebar = false;
      window-decoration = "none";
      window-theme = "ghostty";
      adw-toolbar-style = "flat";

      font-size = 14;
      background-opacity = 0.9;
      shell-integration = "zsh";
      shell-integration-features = "sudo";
      font-family = builtins.head config.fonts.fontconfig.defaultFonts.monospace;

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
