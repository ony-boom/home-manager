{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = lib.mkDefault true;
    package = pkgs.nixGL pkgs.zed-editor;
  };
}
