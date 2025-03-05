{config, ...}: {
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    playlistDirectory = "${config.home.homeDirectory}/.config/mpd/playlists";
    dbFile = "${config.home.homeDirectory}/.config/mpd/database";
  };

  programs.ncmpcpp = {
    enable = true;
  };
}
