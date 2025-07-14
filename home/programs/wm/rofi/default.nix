{
  utils,
  pkgs,
  ...
}: {
  xdg.configFile."rofi" = {
    source = utils.mkDots "/wm/rofi/config";
    recursive = true;
  };

  home.packages = with pkgs; [
    rofi-wayland
  ];
}
