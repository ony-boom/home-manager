{
  mainBar = {
    height = 42;
    margin = "8 20 0 20";
    spacing = 24;
    reload_style_on_change = true;
    modules-left = [
      "hyprland/workspaces"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "tray"
      "group/audio"
      "keyboard"
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
      interval = 1;
      format = "%H:%M";
      timezone = "Indian/Antananarivo";
    };
    "custom/power" = {
      format = "<span size='14pt'>{icon}</span>";
      tooltip = "Power";
      format-icons = {
        default = "";
      };
      on-click = "nwg-bar";
    };
    pulseaudio = {
      format = "<span size='14pt' rise='-5000'>{icon}</span> {volume}%";
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
    "pulseaudio/slider" = {
      min = 0;
      max = 100;
      orientation = "vertical";
    };
    "hyprland/workspaces" = {
      format = "<span size='14pt'>{icon}</span>";
      format-icons = {
        active = "";
        default = "";
      };
      persistent-workspaces = {
        HDMI-A-1 = 2;
      };
    };
  };
}
