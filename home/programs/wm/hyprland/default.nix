{config, ...}: let
  themes = import ./themes.nix;
  hyprApps = {
    terminal = "kitty";
    fileManager = "nautilus";
    menu = "rofi -show drun";
    emoji = "emote";
  };
  colors = {
    transparent = "0x00000000";
  };
in {
  imports = [
    ./hyprlock.nix
  ];

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
        # "dunst &"
        "swaync &"
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

      ## animations
      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
        ];
        animation = [
          "windows, 1, 4, myBezier, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "border, 1, 4, default"
          # "borderangle, 1, 8, default"
          "fade, 1, 4, smoothIn"
          "workspaces, 1, 4, default"
        ];
      };

      input = {
        kb_layout = "us,us";
        kb_variant = ",intl";
        kb_options = "grp:win_space_toggle";
        /*
           kb_model = "";
        kb_rules = "";
        */
        follow_mouse = 1;

        sensitivity = 0;
        numlock_by_default = true;

        touchpad = {
          natural_scroll = false;
        };
      };

      ## Keybindings

      bind = let
        mainMod = "SUPER";
      in [
        "${mainMod}, RETURN, exec, ${hyprApps.terminal}"
        "${mainMod}, E, exec, ${hyprApps.fileManager}"
        "${mainMod}, R, exec, ${hyprApps.menu}"
        "CONTROL ALT, E, exec, ${hyprApps.emoji}"

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
