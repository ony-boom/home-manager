{pkgs, ...}: {
  programs.qutebrowser = {
    package = pkgs.nixGL pkgs.qutebrowser;

    searchEngines = {
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&amp;go=Go&amp;ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      nw = "https://wiki.nixos.org/index.php?search={}";
      g = "https://www.google.com/search?hl=en&amp;q={}";
    };

    settings = {
      auto_save.session = true;

      content = {
        autoplay = false;
        javascript = {
          clipboard = "access";
        };
      };

      tabs = {
        width = "8%";
        indicator.width = 0;
        padding = {
          top = 6;
          left = 8;
          right = 8;
          bottom = 6;
        };
      };

      colors.webpage.preferred_color_scheme = "dark";
    };
    extraConfig = builtins.readFile ./config.py;
  };
}
