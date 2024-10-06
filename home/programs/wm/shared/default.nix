{pkgs, ...}: {
  imports = [
    ./rofi.nix
    ./waybar
  ];

  home.packages = with pkgs; [
    swww
    networkmanagerapplet
  ];
}
