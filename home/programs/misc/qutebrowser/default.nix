{pkgs, ...}: {
  programs.qutebrowser = {
    package = pkgs.nixGL pkgs.qutebrowser;

    searchEngines = {
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&amp;go=Go&amp;ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      nw = "https://wiki.nixos.org/index.php?search={}";
      g = "https://www.google.com/search?q={}";
    };

    settings = {
      auto_save.session = true;
      window.hide_decoration = true;

      content = {
        autoplay = false;
        javascript = {
          clipboard = "access";
        };
      };

      tabs = {
        width = "8%";
        indicator.width = 0;
      };

      colors.webpage.preferred_color_scheme = "auto";
    };
    extraConfig = builtins.readFile ./config.py;
  };
}
