{pkgs}: let
  url = "https://github.com/xiyaowong/Cartograph-CF/archive/refs/heads/main.zip";
  sha256 = "sha256-NVqHxLQZnHb0lMjODkaDwSoglGPkUVJHL1xTmASoER4=";
in
  pkgs.stdenvNoCC.mkDerivation {
    name = "Cartograph-CF Nerd Font";
    src = pkgs.fetchzip {
      inherit url sha256;
    };

    installPhase = ''
      mkdir -p $out/share/fonts/truetype/
      if [ -d "$src/Nerd Font" ]; then
        cp -r "$src/Nerd Font"/*.ttf $out/share/fonts/truetype/
      else
        echo "No fonts found in $src/Nerd Font"
        exit 0
      fi
    '';
  }
