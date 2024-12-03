{nixgl, ...}: {
  imports = [
    ./fonts.nix
    ./gtk
  ];

  nixGl.packages = nixgl.packages;

  nixpkgs.config = {
    allowUnfree = true;
  };
}
