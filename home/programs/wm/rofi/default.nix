{
  utils,
  pkgs,
  ...
}: {
  xdg.configFile."rofi/themes" = {
    source = utils.mkDots "/wm/rofi/themes";
    recursive = true;
  };


  xdg.configFile."rofi/extra" = {
    source = utils.mkDots "/wm/rofi/extra";
    recursive = true;
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "ghostty";
    theme = "rose-pine";

    extraConfig = {
      show-icons = true;
      icon-theme = "Colloid-Dark";
      display-drun = "";
    };
  };

  home.packages = with pkgs; [
    rofi-power-menu
  ];
}
