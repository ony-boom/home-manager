{pkgs, ...}: {
  imports = [
    ./rofi
    ./hyprland
  ];

  home.packages = [
    pkgs.nitrogen
  ];
}
