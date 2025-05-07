{pkgs, ...}: {
  xdg.configFile."autostart/clipse.desktop".text =
    /*
    desktop
    */
    ''
      [Desktop Entry]
      Type=Application
      Exec=${pkgs.clipse}/bin/clipse -listen %f
      X-GNOME-Autostart-enabled=true
      Name=Clipse
      Terminal=false
      Comment=TUI Clipboard Manager
    '';
}
