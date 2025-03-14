{pkgs, ...}: {
  imports = [
    ./mpd.nix
  ];

  services.mms = {
    enable = true;
  };

  home.packages = with pkgs; [
    playerctl

    (pkgs.nixGL vlc)

    (pkgs.nixGL stremio)

    (pkgs.nixGL spotify)
  ];
}
