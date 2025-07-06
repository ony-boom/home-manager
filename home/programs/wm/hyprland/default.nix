{utils, ...}: {
  xdg.configFile."hypr" = {
    source = utils.mkDots "/wm/hyprland/config";
    recursive = true;
  };
}
