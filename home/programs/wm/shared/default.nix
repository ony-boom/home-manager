{pkgs, ...}: {
  imports = [
    ./rofi.nix
    ./nwg
    ./waybar
  ];

  home
    .file
    .".local/share/icons/rose-pine-hyprcursor"
    .source = "${pkgs.rose-pine-hyprcursor}/share/icons/rose-pine-hyprcursor";

  home.packages = with pkgs; [
    swww
    pamixer
    nwg-bar
    nwg-look
    pavucontrol
    rose-pine-cursor
    rose-pine-hyprcursor
    networkmanagerapplet
  ];
}
