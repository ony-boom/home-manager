{
  config,
  utils,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.services.mpd.enable {
    home.packages = with pkgs; [
      rmpc
    ];

    xdg.configFile."rmpc/config.ron".source = utils.mkDots "/media/mpd/rmpc/config.ron";
  };
}
