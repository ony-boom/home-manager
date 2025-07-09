{
  config,
  lib,
  ...
}: {
  imports = [
    ./rmpc
  ];

  services.mpd = {
    enable = lib.mkDefault true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    playlistDirectory = "${config.home.homeDirectory}/.config/mpd/playlists";
    dbFile = "${config.home.homeDirectory}/.config/mpd/database";

    extraConfig = ''
        audio_output {
        type        "pulse"
        name        "My Output"
        mixer_type  "software"
      }
    '';
  };
}
