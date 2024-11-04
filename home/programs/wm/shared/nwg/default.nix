{pkgs, ...}: let
  bar = import ./bar.nix {inherit pkgs;};
in {
  xdg.configFile."nwg-bar/bar.json".text = builtins.toJSON bar;
}
