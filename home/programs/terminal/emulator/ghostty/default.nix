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

  settings = {
    command = config.defaultApps.shell;
    theme = "light:${theme.light},dark:${theme.dark}";

    window-padding-y = 10;
    window-padding-x = 12;

    gtk-titlebar = false;
    window-decoration = "none";
    window-theme = "ghostty";
    adw-toolbar-style = "flat";
    background-opacity = 0.95;

    font-size = 15;
    font-style = "SemiBold";
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

  renderSettings = settings: let
    renderKV = name: value:
      if lib.isList value
      then lib.concatMapStringsSep "\n" (v: "keybind = ${v}") value
      else "${lib.replaceStrings ["_"] ["-"] name} = ${toString value}";
  in
    lib.concatStringsSep "\n" (lib.mapAttrsToList renderKV settings);
in
  lib.mkMerge [
    {
      xdg.configFile."ghostty/themes" = {
        source = utils.mkDots "/terminal/emulator/ghostty/themes";
        recursive = true;
      };

      programs.ghostty = {
        # Disabled for now due to unresolved driver issues.
        # I’m installing Ghostty manually (yay on Arch, snap on Ubuntu).
        enable = false;
        inherit settings;
      };
    }

    (lib.mkIf (!config.programs.ghostty.enable) {
      xdg.configFile."ghostty/config".text = renderSettings settings;
    })
  ]
