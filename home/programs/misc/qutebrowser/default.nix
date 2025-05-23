{pkgs, ...}: {
  home.packages = with pkgs; [vim-full];
  programs.qutebrowser = {
    enable = true;
    package = pkgs.nixGL pkgs.qutebrowser;

    loadAutoconfig = true;

    searchEngines = {
      aw = "https://wiki.archlinux.org/?search={}";
      g = "https://www.google.com/search?q={}";
      np = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}";
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
