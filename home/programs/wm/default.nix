{pkgs, ...}: {
  imports = [
    ./mako
    ./rofi
    ./waybar
    ./ironbar
    ./hyprland
  ];

  home.packages = with pkgs; [
    cliphist
    swww
    (nixGL satty)
  ];
}
