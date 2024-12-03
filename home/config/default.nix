{nixgl, ...}: {
  imports = [
    ./fonts.nix
    ./gtk
  ];
  nixGL.packages = nixgl.packages;
  nixpkgs.config = {
    allowUnfree = true;
  };
}
