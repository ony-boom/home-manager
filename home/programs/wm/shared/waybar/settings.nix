{lib}: let
  mkSpanIcon = {
    icon,
    size ? "14pt",
    rise ? 0,
    extraText ? "",
  }:
    lib.strings.trim "<span size='${size}' rise='${builtins.toString rise}'>${icon}</span> ${extraText}";
in {
  mainBar = {
    height = 42;
    margin = "8 20 0 20";
    spacing = 24;
    reload_style_on_change = true;

    modules-left = [
      "hyprland/workspaces"
    ];

    modules-center = lib.mkDefault [
      "clock"
    ];

    modules-right = [
      "tray"
      "group/audio"
      "hyprland/language"
      "custom/power"
    ];

    "group/audio" = {
      orientation = "horizontal";
      modules = [
        "pulseaudio"
      ];
    };

    tray = {
      spacing = 16;
    };

    "clock#time" = {
      format = "{%H:%M}";
      timezone = "Indian/Antananarivo";
      interval = 1;
    };

    "custom/power" = {
      format = mkSpanIcon {
        icon = "{icon}";
        rise = -5000;
      };
      tooltip = "Power";
      format-icons = {
        default = "󰤆 ";
      };
      on-click = "nwg-bar";
    };

    pulseaudio = {
      format = mkSpanIcon {
        icon = "{icon}";
        rise = -5000;
        extraText = "{volume}%";
      };
      format-muted = "";
      format-icons = {
        default = [
          ""
          ""
        ];
      };
      on-click = "pavucontrol";
      on-click-right = "pamixer -t";
    };

    "hyprland/language" = {
      format = mkSpanIcon {
        icon = "󰧺 ";
        rise = -4000;
        extraText = "{}";
      };
      format-en = "en";
    };

    "pulseaudio/slider" = {
      min = 0;
      max = 100;
      orientation = "vertical";
    };

    "hyprland/workspaces" = {
      format = mkSpanIcon {
        icon = "{icon}";
      };
      format-icons = {
        active = "";
        default = "";
      };
    };
  };
}
