{pkgs, ...}: {
  imports = [
    ./mako
    ./waybar
    ./hyprland
    ./nwg-bar
  ];

  home.packages = with pkgs; [
    swww
  ];
}
