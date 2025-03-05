{pkgs, ...}: {
  imports = [
    ./mpd.nix
  ];
  home.packages = with pkgs; [
    playerctl

    (pkgs.nixGL vlc)

    (pkgs.nixGL stremio)

    (pkgs.nixGL spotify)
  ];
}
