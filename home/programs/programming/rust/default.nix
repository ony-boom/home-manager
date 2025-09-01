{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.fenix.overlays.default];

  home.packages = with pkgs; [
    fenix.default.toolchain
    fenix.rust-analyzer
  ];
}
