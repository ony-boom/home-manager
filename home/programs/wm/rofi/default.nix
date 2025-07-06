{utils, pkgs, ...}: {
  xdg.configFile."rofi/themes" = {
    source = utils.mkDots "/wm/rofi/themes";
    recursive = true;
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "ghostty";
    theme = "rose-pine";

    extraConfig = {
      show-icons = true;
      display-drun = "";
    };
  };
}
