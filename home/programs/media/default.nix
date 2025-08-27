{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./mpd
  ];

  services.mms = {
    enable = lib.mkDefault true;
    sessionSecretFile = config.age.secrets.mms.path;
  };

  home.packages = with pkgs; [
    playerctl

    (pkgs.nixGL vlc)

    (pkgs.nixGL stremio)

    (pkgs.nixGL spotify)
  ];
}
