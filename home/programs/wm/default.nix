{pkgs, ...}: {
  imports = [
    ./rofi
    ./waybar
    ./hyprland
  ];

  home.packages = with pkgs; [
    nitrogen
    swww
  ];
}
