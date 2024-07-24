{
  pkgs,
  lib,
  config,
}: let
  nixglWrapper =
    if config.gpuType == "nvidia"
    then pkgs.nixgl.auto.nixGLNvidia
    else pkgs.nixgl.nixGLIntel;
in {
  wrap = pkg:
    pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
      NIXPKGS_ALLOW_UNFREE=1
         mkdir $out
         ln -s ${pkg}/* $out
         rm $out/bin
         mkdir $out/bin
         for bin in ${pkg}/bin/*; do
          wrapped_bin=$out/bin/$(basename $bin)
          echo "exec ${lib.getExe nixglWrapper} $bin \$@" > $wrapped_bin
          chmod +x $wrapped_bin
         done
    '';
}
