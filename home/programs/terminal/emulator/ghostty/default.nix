{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    programs.ghostty = {
      enable = lib.mkEnableOption "Enable ghostty";
    };
  };

  config = lib.mkIf config.programs.ghostty.enable {
    xdg.configFile."ghostty/config".text = ''
      font-size = 14
      auto-update = off
      theme = rose-pine

      window-padding-y = 10
      window-padding-x = 12
      window-decoration = false
      gtk-single-instance = true

      background-opacity = 0.8
      font-family = ${builtins.head config.fonts.fontconfig.defaultFonts.monospace}

      # keybind = ctrl+shift+right=next_tab
      # keybind = ctrl+shift+right=previous_tab
      #
      # keybind = ctrl+up=goto_split:top
      # keybind = ctrl+left=goto_split:left
      # keybind = ctrl+down=goto_split:bottom
      # keybind = ctrl+right=goto_split:right
    '';

    home.packages = with pkgs; [
      (pkgs.nixGL ghostty)
    ];
  };
}
