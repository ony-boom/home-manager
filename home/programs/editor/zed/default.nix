{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.zed-editor = {
    enable = lib.mkDefault true;
    package = pkgs.nixGL pkgs.zed-editor;
  };

  xdg.configFile."zed" = {
    source = config.lib.file.mkOutOfStoreSymlink /${config.home.homeDirectory}/.config/home-manager/home/programs/editor/zed/config;
    recursive = true;
  };
}
