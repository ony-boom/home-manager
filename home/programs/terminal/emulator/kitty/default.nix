{
  pkgs,
  config,
  lib,
  self,
  ...
}: let
  nixGL = import (self + /nix/nixGL.nix) {inherit pkgs config lib;};
  defaultPackages = import "${self}/nix/defaultPackages.nix";
in {
  programs.kitty = {
    enable = defaultPackages.terminalEmulator == "kitty";
    theme = "Everforest Dark Medium";
    package = nixGL.wrap pkgs.kitty;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
