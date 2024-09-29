{pkgs, ...}: {
  imports = [
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    swww
    networkmanagerapplet
  ];
}
