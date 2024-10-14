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
      mkdir -p $out/share/fonts/opentype/

      # Install TTF fonts
      if [ -d "$src/Nerd Font" ]; then
        cp -r "$src/Nerd Font"/*.ttf $out/share/fonts/truetype/
      else
        echo "No TTF fonts found in $src/Nerd Font"
        exit 0
      fi

      # Install OTF fonts
      if [ -d "$src" ] && [ "$(ls -A $src/*.otf 2>/dev/null)" ]; then
        cp -r "$src"/*.otf $out/share/fonts/opentype/
      else
        echo "No OTF fonts found in $src"
      fi
    '';
  }
