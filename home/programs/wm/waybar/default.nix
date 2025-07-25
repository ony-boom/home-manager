{lib, ...}: {
  programs.waybar = {
    enable = lib.mkDefault true;
    style = ./style.css;

    settings = {
      main = {
        height = 30;
        spacing = 12;
        layer = "top";
        position = "top";
        reload_style_on_change = true;

        modules-left = [
          "custom/distro"
          "hyprland/workspaces"
          # "mpris"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "network"
          "group/hardware"
          "bluetooth"
          "tray"
        ];

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = [
              1
              2
              3
            ];
          };
        };

        tray = {
          icon-size = 21;
          spacing = 12;
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        memory = {
          format = "{}% <span> </span>";
        };

        pulseaudio = {
          format = "{volume}% <span>{icon}</span>";
          format-muted = "󰝟";
          format-icons = {
            headphone = "󰋋";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
        };

        "group/hardware" = {
          orientation = "horizontal";
          modules = [
            "memory"
            "pulseaudio"
            "battery"
          ];
        };

        network = {
          interval = 5;
          format = "{bandwidthUpBits} 󰁝 <span color=\"#6e6a86\">|</span> {bandwidthDownBits} 󰁅";
        };

        "custom/distro" = {
          format = "󰣇";
        };

        battery = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁼"
            "󰁿"
            "󰂂"
            "󰁹"
          ];
          max-length = 25;
        };

        bluetooth = {
          format = "";
          format-connected = "󰂱";
          on-click = "blueberry";
          format-disabled = "󰂲";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
        };

        mpris = {
          format = "<span color=\"#6e6a86\">{player_icon}</span> {title} - {artist}";
          max-length = 32;
          player-icons = {
            spotify = "󰓇";
            default = "󰎇";
          };
        };
      };
    };
  };
}
