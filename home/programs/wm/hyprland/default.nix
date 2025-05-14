{config, ...}: let
  mkHmPath = path: config.lib.file.mkOutOfStoreSymlink /${config.home.homeDirectory}/.config/home-manager/home/programs${path};
in {
  xdg.configFile = {
    "hypr" = {
      source = mkHmPath /wm/hyprland/hypr;
      recursive = true;
    };

    "hyprpanel" = {
      source = mkHmPath /wm/hyprland/hyprpanel;
      recursive = true;
    };
  };
}
