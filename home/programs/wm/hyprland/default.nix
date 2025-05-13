{config, ...}: {
  xdg.configFile = {
    "hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink /${config.home.homeDirectory}/.config/home-manager/home/programs/wm/hyprland/hypr;
      recursive = true;
    };

    "hyprpanel" = {
      source = config.lib.file.mkOutOfStoreSymlink /${config.home.homeDirectory}/.config/home-manager/home/programs/wm/hyprland/hyprpanel;
      recursive = true;
    };
  };
}
