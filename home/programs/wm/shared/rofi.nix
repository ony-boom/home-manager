{
  pkgs,
  config,
  ...
}: let
  mkRofiTheme = src:
    pkgs.stdenvNoCC.mkDerivation {
      name = "rofi-theme-rose-pine";
      inherit src;
      installPhase = ''
        mkdir -p $out/share/rofi/themes/
        if [ -d "$src" ]; then
          cp -r "$src"/*.rasi $out/share/rofi/themes/
        else
          echo "No themes found in $src"
          exit 0
        fi
      '';
    };

  themes = {
    rose-pine = mkRofiTheme (pkgs.fetchzip {
      url = "https://github.com/rose-pine/rofi/archive/refs/heads/main.zip";
      sha256 = "sha256-PnXk3t0Ce8ButnSsZFe7Id9SqgsnVUUXGSlTAO1wcaY=";
    });
  };
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    theme = {
      "@import" = "${themes.rose-pine}/share/rofi/themes/rose-pine.rasi";

      "window" = {
        width = 524;
        height = 312;
      };

      "element" = {
        margin = mkLiteral "4px 0px";
        padding = mkLiteral "4px 8px";
        border-radius = mkLiteral "4px";
      };
    };
    extraConfig = {
      # show-icons = true;
    };
    package =
      if config.useWayland
      then pkgs.rofi-wayland
      else pkgs.rofi;
  };
}
