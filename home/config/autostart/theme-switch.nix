{pkgs, ...}: let
  themeSwitcher = pkgs.writeShellScriptBin "theme-switcher" ''

    # TODO: Use `config.gtk` for this
    LIGHT_GTK_THEME="Colloid-Light"
    DARK_GTK_THEME="Colloid-Dark"
    LIGHT_SHELL_THEME="Colloid-Light"
    DARK_SHELL_THEME="Colloid-Dark"

    schema_exists() {
        gsettings list-schemas | grep -q "$1"
    }

    if ! schema_exists "org.gnome.desktop.interface"; then
        echo "Missing schema: org.gnome.desktop.interface"
        exit 0
    fi

    if ! schema_exists "org.gnome.shell.extensions.user-theme"; then
        echo "Missing schema: org.gnome.shell.extensions.user-theme"
        exit 0
    fi

    apply_themes() {
        local color_scheme=$1

        if [[ $color_scheme == *"dark"* ]]; then
            gsettings set org.gnome.desktop.interface gtk-theme "$DARK_GTK_THEME"
            gsettings set org.gnome.shell.extensions.user-theme name "$DARK_SHELL_THEME"
        else
            gsettings set org.gnome.desktop.interface gtk-theme "$LIGHT_GTK_THEME"
            gsettings set org.gnome.shell.extensions.user-theme name "$LIGHT_SHELL_THEME"
        fi
    }

    initial_scheme=$(gsettings get org.gnome.desktop.interface color-scheme)
    apply_themes "$initial_scheme"

    gsettings monitor org.gnome.desktop.interface color-scheme | while read -r line; do
        scheme=$(echo "$line" | awk '{print $2}')
        apply_themes "$scheme"
    done
  '';
in {
  home.packages = [themeSwitcher];

  xdg.configFile."autostart/theme-switcher.desktop".text =
    /*
    desktop
    */
    ''
      [Desktop Entry]
      Type=Application
      Exec=${themeSwitcher}/bin/theme-switcher
      Hidden=false
      NoDisplay=false
      X-GNOME-Autostart-enabled=true
      Name=Theme Switcher
      Comment=Switches GTK and Shell themes on dark/light mode toggle
    '';
}
