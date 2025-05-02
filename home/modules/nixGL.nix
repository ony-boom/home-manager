{config, nixgl, ...}: {
  nixGL.packages = nixgl.packages;
  nixpkgs.overlays = [
    (final: prev: {
      nixGL = pkg: config.lib.nixGL.wrap pkg;
    })
  ];
}
