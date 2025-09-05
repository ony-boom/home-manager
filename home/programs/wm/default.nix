{pkgs, ...}: {
  imports = [
    ./mako
    ./rofi
    ./waybar
    ./hyprland
    ./nwg-bar
  ];

  home.packages = with pkgs; [
    swww
  ];
}
