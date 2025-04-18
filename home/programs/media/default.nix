{pkgs, lib, ...}: {
  imports = [
    ./mpd.nix
  ];

  services.mms = {
    enable = lib.mkDefault true;
  };

  home.packages = with pkgs; [
    playerctl

    (pkgs.nixGL vlc)

    (pkgs.nixGL stremio)

    (pkgs.nixGL spotify)
  ];
}
