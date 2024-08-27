{
  self,
  pkgs,
  config,
  lib,
  ...
}: let
  nixGL = import (self + /nix/nixGL.nix) {inherit pkgs config lib;};
  defaultPackage = import (self + /nix/defaultPackages.nix);

in {
  programs.wezterm = {
    enable = defaultPackage.terminalEmulator == "wezterm";
    package = nixGL.wrap pkgs.wezterm;
  };

  xdg.configFile."wezterm".source = ./config;
}
