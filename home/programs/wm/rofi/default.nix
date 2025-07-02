{
  pkgs,
  utils,
  ...
}: let
  isX11 = "x11" == (builtins.getEnv "XDG_SESSION_TYPE");
in {
  xdg.configFile."rofi/themes" = {
    source = utils.mkDots "/wm/rofi/themes";
    recursive = true;
  };

  programs.rofi = {
    enable = true;
    package =
      if isX11
      then pkgs.rofi
      else pkgs.rofi-wayland;

    terminal = "ghostty";
    theme = "rose-pine";

    extraConfig = {
      show-icons = true;
      display-drun = " Apps: ";
    };
  };
}
