{
  pkgs,
  lib,
  utils,
  ...
}: {
  programs.zed-editor = {
    enable = lib.mkDefault true;
    package = pkgs.nixGL pkgs.zed-editor;
  };

  xdg.configFile."zed" = {
    source = utils.mkDots "/text-editor/zed/config";
    recursive = true;
  };
}
