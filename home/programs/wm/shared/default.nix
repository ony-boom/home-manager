{pkgs, ...}: {
  imports = [
    ./rofi.nix
  ];

  xdg.configFile."picom".source = ./picom;

  home.packages = with pkgs; [
		dex
    nitrogen
    nwg-look
    picom-pijulius
  ];
}
