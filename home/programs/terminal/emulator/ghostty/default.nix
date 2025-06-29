{
  config,
  utils,
  lib,
  ...
}: let
  theme = {
    light = "rose-pine-dawn";
    dark = "rose-pine";
  };
in
  {
    xdg.configFile."ghostty/themes" = {
      source = utils.mkDots "/terminal/emulator/ghostty/themes";
      recursive = true;
    };

    programs.ghostty = {
      #TODO: Enable again when driver isssue is resolved, I don't know if it is a bug in ghostty or in the driver
      # for now, I'll install it manually via yay and snap for ubuntu
      enable = false;

      settings = {
        command = config.defaultApps.shell;
        theme = "light:${theme.light},dark:${theme.dark}";

        window-padding-y = 10;
        window-padding-x = 12;

        # just for title bar to look good
        gtk-titlebar = false;
        window-decoration = "none";
        window-theme = "ghostty";
        adw-toolbar-style = "flat";

        font-size = 15;
        font-style = "SemiBold";
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
  // lib.mkIf (config.programs.ghostty.enable
    == false) {
    xdg.configFile."ghostty/config".text = ''
      command = ${config.defaultApps.shell}
      theme = light:${theme.light},dark:${theme.dark}

      window-padding-y = 10
      window-padding-x = 12

      gtk-titlebar = false
      window-decoration = none
      window-theme = ghostty
      adw-toolbar-style = flat

      font-size = 15
      font-style = SemiBold
      background-opacity = 0.9
      shell-integration = zsh
      shell-integration-features = sudo
      font-family = ${builtins.head config.fonts.fontconfig.defaultFonts.monospace}

      keybind = ctrl+shift+r=reload_config
      keybind += ctrl+up=goto_split:up
      keybind += ctrl+down=goto_split:down
      keybind += ctrl+left=goto_split:left
      keybind += ctrl+right=goto_split:right
    '';
  }
