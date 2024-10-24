{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./rofi.nix
    ./dunst
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
    libnotify
    pavucontrol
    rose-pine-cursor
    rose-pine-hyprcursor
    networkmanagerapplet
    (
      if config.useWayland
      then wl-clipboard
      else xclip
    )
  ];
}
