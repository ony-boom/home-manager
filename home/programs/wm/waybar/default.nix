{lib, ...}: let
  config = {
    settings = import ./config.nix;
  };
  style = import ./styles;
in {
  programs.waybar = {
    enable = lib.mkDefault true;
    inherit config style;
  };
}
