{utils, ...}: {
  xdg.configFile."mako" = {
    source = utils.mkDots "/wm/mako/config";
    recursive = true;
  };
}
