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
      sha256 = "sha256-V1o8Rv9Jcojp25qOoDm/QWOb7woMVrSXH/xZHAiitB0=";
    });
  };
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enabled = config.useWM;
    theme = {
      "@import" = "${themes.rose-pine}/share/rofi/themes/rose-pine.rasi";

      "*" = {
        font = "Open Sans 12";
        font-weight = "700";
      };

      "window" = {
        border = 2;
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
      show-icons = true;
    };
    package =
      if config.useWayland
      then pkgs.rofi-wayland
      else pkgs.rofi;
  };
}
