{pkgs, ...}: {
  imports = [
    ./mako
    ./waybar
    ./hyprland
    ./walker
    ./nwg-bar
  ];

  home.packages = with pkgs; [
    swww
  ];
}
