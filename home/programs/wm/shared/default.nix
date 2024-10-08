{pkgs, ...}: {
  imports = [
    ./rofi.nix
  ];

  programs = {
    waybar.enable = true;
  };

  xdg.configFile."waybar".source = ./waybar;

  home.packages = with pkgs; [
    swww
    networkmanagerapplet
  ];
}
