{
  pkgs,
  config,
  lib,
  ...
}: let
  nixGL = import ../../../../../nix/nixGL.nix {inherit pkgs config lib;};
  defaultPackages = import ../../../../../nix/defaultPackages.nix;
in {
  programs.kitty = {
    enable = defaultPackages.terminalEmulator == "kitty";
    theme = "Everforest Dark Medium";
    package = nixGL.wrap pkgs.kitty;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
