{config, lib, ...}: {
  services.mpd = {
    enable =  lib.mkDefault true;
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

  programs.ncmpcpp = {
    enable = config.services.mpd.enable;
    mpdMusicDir = "~/Music";
  };
}
