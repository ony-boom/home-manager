{pkgs, ...}: let
  themes = {
    rose-pine = {
      icons = "rose-pine-icons";
      colors = {
        default = {
          background = "#26233a";
          foreground = "#e0def4";

          urgency_low = {
            background = "#26273d";
            highlight = "#31748f";
            frame_color = "#31748f";
          };

          urgency_normal = {
            background = "#362e3c";
            highlight = "#f6c177";
            frame_color = "#f6c177";
          };

          urgency_critical = {
            background = "#35263d";
            highlight = "#eb6f92";
            frame_color = "#eb6f92";
          };
        };
      };
    };
  };
in {
  services.dunst = {
    # enable = true;
    iconTheme = {
      name = themes.rose-pine.icons;
      package = pkgs.rose-pine-icon-theme;
    };
    settings = {
      global = {
        width = 256;
        offset = "20x8";

        progress_bar_corner_radius = 2;

        padding = 10;
        horizontal_padding = 10;
        frame_width = 1;
        gap_size = 3;

        enable_recursive_icon_lookup = true;
        corner_radius = 8;

        background = themes.rose-pine.colors.default.background;
        foreground = themes.rose-pine.colors.default.foreground;
      };

      urgency_low = {
        background = themes.rose-pine.colors.default.urgency_low.background;
        highlight = themes.rose-pine.colors.default.urgency_low.highlight;
        frame_color = themes.rose-pine.colors.default.urgency_low.frame_color;
        default_icon = "dialog-information";
        format = "<b><span foreground='${themes.rose-pine.colors.default.urgency_low.highlight}'>%s</span></b>\\n%b";
      };

      urgency_normal = {
        background = themes.rose-pine.colors.default.urgency_normal.background;
        highlight = themes.rose-pine.colors.default.urgency_normal.highlight;
        frame_color = themes.rose-pine.colors.default.urgency_normal.frame_color;
        default_icon = "dialog-warning";
        format = "<b><span foreground='${themes.rose-pine.colors.default.urgency_normal.highlight}'>%s</span></b>\\n%b";
      };

      urgency_critical = {
        background = themes.rose-pine.colors.default.urgency_critical.background;
        highlight = themes.rose-pine.colors.default.urgency_critical.highlight;
        frame_color = themes.rose-pine.colors.default.urgency_critical.frame_color;
        default_icon = "dialog-error";
        format = "<b><span foreground='${themes.rose-pine.colors.default.urgency_critical.highlight}'>%s</span></b>\\n%b";
      };
    };
  };
}
