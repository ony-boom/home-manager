{lib, ...}: {
  programs.wofi = {
    enable = lib.mkDefault true;

    style = lib.readFile ./style.css;

    settings = {
      width = 500;
      height = 320;
      prompt = "Search";
      term = "ghostty";
      location = "center";
      allow_images = true;
      hiide_scroll = true;
      insensitive = true;
      no_actions = true;
    };
  };
}
