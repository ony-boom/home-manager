{config, ...}: let
  themes = import ./themes.nix;
  hyprApps = {
    terminal = "kitty";
    fileManager = "nautilus";
    menu = "rofi -show drun";
  };
  colors = {
    transparent = "0x00000000";
  };
in {
  wayland.windowManager.hyprland = {
    systemd.variables = ["--all"];
    extraConfig = builtins.readFile ./hyprland.conf;
    settings = {
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
        "XCURSOR_THEME,rose-pine-hyprcursor"
        "XDG_CURRENT_DESKTOP,Hyprland"
      ];
      exec-once = [
        "swww-daemon &"
        "swww restore"
        "waybar &"
        "nm-applet &"
        "lxqt-policykit-agent &"
      ];

      ## Look and feel
      general = {
        gaps_in = 6;
        gaps_out = 20;

        border_size = 2;

        "col.active_border" = themes.rose-pine.rose;
        "col.inactive_border" = colors.transparent;

        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        drop_shadow = false;
        blur = {
          enabled = true;
          size = 6;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      ## Keybindings

      bind = let
        mainMod = "SUPER";
      in [
        "${mainMod}, RETURN, exec, ${hyprApps.terminal}"
        "${mainMod}, E, exec, ${hyprApps.fileManager}"
        "${mainMod}, R, exec, ${hyprApps.menu}"

        "SUPER SHIFT, LEFT, movewindow, l"
        "SUPER SHIFT, RIGHT, movewindow, r"
        "SUPER SHIFT, UP, movewindow, u"
        "SUPER SHIFT, DOWN, movewindow, d"
      ];
    };
  };

  xdg.configFile."environment.d/envvars.conf".text =
    if config.isNixOS
    then ""
    else ''
        PATH=$PATH:$HOME/.nix-profile/bin
    '';
}
