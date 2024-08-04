{
  pkgs,
  system,
}: let
  sources = {
    x86_64-linux = {
      url = "https://github.com/bettervim/better-tmux/releases/latest/download/better-tmux-linux-x64";
      sha256 = "1z6pkgfzd5xm56j61vjd4mvhh17sf0gdc99pnlvqydjmpdj01pwh";
    };
  };
in
  pkgs.stdenv.mkDerivation rec {
    name = "better-tmux";
    src = pkgs.fetchurl (sources.${system});
    dontUnpack = true;
    dontFixup = true;

    installPhase = ''
      mkdir -p $out/bin
      install -m755 $src $out/bin/${name}
    '';
  }
