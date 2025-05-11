{pkgs, ...}: let
  cliphist = pkgs.writeShellScriptBin "cliphist" ''
    wl-paste --type text --watch cliphist store # Stores only text data
    wl-paste --type image --watch cliphist store # Stores only image data
  '';
in {
  home.packages = [cliphist];

  xdg.configFile."autostart/theme-switcher.desktop".text =
    /*
    desktop
    */
    ''
      [Desktop Entry]
      Type=Application
      Terminal=false
      Exec=${cliphist}/bin/cliphist
      X-GNOME-Autostart-enabled=true
      Name=Cliphist
      Comment=Starts the cliphist daemon
    '';
}
