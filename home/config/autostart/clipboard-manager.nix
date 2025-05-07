{pkgs, ...}: let
  name = "cliphist-watch";
  cliphist-watch = pkgs.writeShellScriptBin name ''
    ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store
    ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store
  '';
in {
  xdg.configFile."autostart/${name}.desktop".text =
    /*
    desktop
    */
    ''
      [Desktop Entry]
      Type=Application
      Exec=${cliphist-watch}/bin/${name}
      NoDisplay=false
      X-GNOME-Autostart-enabled=true
      Name=Theme Switcher
      Comment=Watch change in clipboard history
    '';
}
