{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    programs.ghostty = {
      enable = lib.mkEnableOption "Enable ghostty";
    };
  };

  config = lib.mkIf config.programs.ghostty.enable {
    xdg.configFile."ghostty".source = ./config;

    home.packages = with pkgs; [
      (pkgs.nixGL ghostty)
    ];
  };
}
