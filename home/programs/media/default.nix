{
  pkgs,
  ...
}: {
  imports = [
    ./mpd
    ./mms.nix
  ];

  home.packages = with pkgs; [
    playerctl

    (pkgs.nixGL vlc)

    (pkgs.nixGL stremio)

    (pkgs.nixGL spotify)
  ];
}
