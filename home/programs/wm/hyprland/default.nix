{utils, ...}: {
  xdg.configFile = {
    "hypr" = {
      source = utils.mkDots "/wm/hyprland/hypr";
      recursive = true;
    };

    "hyprpanel" = {
      source = utils.mkDots "/wm/hyprland/hyprpanel";
      recursive = true;
    };
  };
}
