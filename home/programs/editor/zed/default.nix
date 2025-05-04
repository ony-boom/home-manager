{
  pkgs,
  lib,
  config,
  username,
  ...
}: {
  programs.zed-editor = {
    enable = lib.mkDefault true;
    package = pkgs.nixGL pkgs.zed-editor;
  };

  xdg.configFile."zed" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/${username}/.config/home-manager/home/programs/editor/zed/config;
    recursive = true;
  };
}
