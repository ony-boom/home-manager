{nixgl, system, ...}: {
  imports = [
    ./fonts.nix
    ./gtk
  ];

  nixGl.packages = nixgl.packages.${system};

  nixpkgs.config = {
    allowUnfree = true;
  };
}
