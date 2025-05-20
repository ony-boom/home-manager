{config, ...}: let
  mkHmPath = path: config.lib.file.mkOutOfStoreSymlink /${config.home.homeDirectory}/.config/home-manager/home/programs${path};
in {
  xdg.configFile = {
    "qutebrowser" = {
      source = mkHmPath /others/qutebrowser;
      recursive = true;
    };
  };
}
