{utils, ...}: {
  xdg.configFile."waybar" = {
    source = utils.mkDots "/wm/waybar/config";
    recursive = true;
  };
}
