{pkgs, ...}: {
  imports = [
    ./mako
    ./waybar
    ./hyprland
    ./walker
  ];

  home.packages = with pkgs; [
    nitrogen
    swww
    grim
    slurp
  ];
}
