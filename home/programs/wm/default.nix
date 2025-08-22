{pkgs, ...}: {
  imports = [
    ./rofi
    # ./swaync
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
