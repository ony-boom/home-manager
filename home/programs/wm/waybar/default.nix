{lib, ...}: let
  settings = import ./config.nix;
  style = import ./styles lib;
in {
  programs.waybar = {
    enable = lib.mkDefault true;
    inherit settings style;
  };
}
