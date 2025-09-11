lib: let
  theme-name = "rose-pine";
  theme-colors = import ./colors/${theme-name}.nix;

  css-colors = lib.concatStringsSep "\n" (lib.mapAttrsToList
    (key: value: "@define-color ${key} ${value};")
    theme-colors);
in
  /*
  css
  */
  ''
    ${css-colors}

    * {
        font-family: "JetBrainsMono Nerd Font Propo";
    }

    window#waybar {
        color: @text;
        background: transparent;
    }

    #waybar > box {
        padding: 8px 16px;
        padding-bottom: 0;
        padding-bottom: 0;
    }

    #workspaces,
    #clock,
    #hardware,
    #network,
    #bluetooth,
    #tray,
    #mpris,
    #custom-distro {
        color: @text;
        background: @base;
        border-radius: 8px;
    }

    #clock,
    #hardware,
    #tray,
    #network,
    #bluetooth,
    #mpris,
    #custom-distro {
        padding: 0 10px;
    }

    #workspaces button {
        color: @muted;
        transition:
            color 0.2s ease-in-out,
            background-color 0.2s ease-in-out;
    }

    #workspaces button:hover {
        color: @text;
        background-color: @highlightLow;
    }

    #workspaces button.active {
        color: @text;
    }

    #bluetooth, #custom-distro {
      min-width: 20px;
      padding-left: 10px;
      transition: color 0.2s ease-in-out;
    }

    #custom-distro {
      color: @rose;
    }

    #memory {
      margin-right: 12px;
    }

    #battery {
      margin-left: 12px;
    }

    #bluetooth.off {
      color: @muted;
    }

    #bluetooth.connected {
      color: @pine;
    }

    #battery.critical {
      color: @rose;
    }

    #battery.warning {
      color: @peach;
    }
  ''
