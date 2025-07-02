{utils, ...}: {
  xdg.configFile."polybar" = {
    source = utils.mkDots "/wm/polybar/config";
    recursive = true;
  };
}
