{
  pkgs,
  utils,
  ...
}: {
  programs.rofi = {
    enable = true;
    theme = "rose-pine";

    font = "monospace 12";

    extraConfig = {
      show-icons = true;
      display-drun = "";
      display-clipboard = "";
    };

    plugins = with pkgs; [
      rofi-calc
    ];
  };

  xdg.configFile."rofi/themes" = {
    source = utils.mkDots "/wm/rofi/themes";
    recursive = true;
  };


  xdg.configFile."rofi/scripts" = {
    source = utils.mkDots "/wm/rofi/scripts";
    recursive = true;
  };
}
