{pkgs, ...}: {
  imports = [
    ./rofi
    ./mako
    ./waybar
    ./hyprland
  ];

  home.packages = with pkgs; [
    nitrogen
    swww
    grim
    slurp
  ];
}
