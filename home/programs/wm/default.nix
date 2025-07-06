{pkgs, ...}: {
  imports = [
    ./rofi
    ./hyprland
  ];

  home.packages = with pkgs; [
    nitrogen
    swww
  ];
}
