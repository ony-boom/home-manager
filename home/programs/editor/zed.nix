let
  languages-settings = {
    languages = {
      Nix = {
        language_servers = ["nil" "!nixd"];
        formatter.external = {
          command = "alejandra";
          args = ["--quiet" "--"];
        };
      };
    };
  };
in
  {pkgs, ...}: {
    programs.zed-editor = {
      enable = true;
      package = pkgs.nixGL pkgs.zed-editor;
      extensions = [
        "rose-pine-theme"
        "colored-zed-icons-theme"
      ];

      userSettings =
        {
          vim_mode = true;
          ui_font_size = 16;
          buffer_font_size = 16;

          vim = {
            use_system_clipboard = "always";
            toggle_relative_line_numbers = true;
          };

          features = {
            edit_prediction_provider = "zed";
          };

          theme = {
            mode = "system";
            dark = "Rosé Pine";
            light = "Rosé Pine Moon";
          };

          icon_theme = {
            dark = "Colored Zed Icons Theme Dark";
            light = "Colored Zed Icons Theme Light";
          };
        }
        // languages-settings;

      userKeymaps = [
        {
          context = "Editor && vim_mode == normal";
          bindings = {
            "space l f" = "editor::Format";
            "space l r" = "editor::Rename";
            "space c" = "pane::CloseActiveItem";
            "] b" = "pane::ActivateNextItem";
            "[ b" = "pane::ActivatePrevItem";
            "space e" = "workspace::ToggleLeftDock";
            "space f f" = "file_finder::Toggle";
            "space f w" = "pane::DeploySearch";
          };
        }
        {
          context = "ProjectPanel";
          bindings = {
            a = "project_panel::NewFile";
            d = "project_panel::Trash";
            x = "project_panel::Cut";
            c = "project_panel::Copy";
            p = "project_panel::Paste";
            "space e" = "workspace::ToggleLeftDock";
          };
        }
      ];
    };
  }
