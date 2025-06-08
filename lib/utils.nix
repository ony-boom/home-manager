{config, ...}: let
  mkDots = path:
    config.lib.file.mkOutOfStoreSymlink
    "/${config.home.homeDirectory}/.config/home-manager/home/programs${path}";
in {
  inherit mkDots;
}
