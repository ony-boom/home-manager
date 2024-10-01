{
  lib,
  config,
  # pkgs,
  ...
}: {
  config = lib.mkIf config.programs.hyprland.enable {
    xdg.configFile."hypr".source = ./hypr;

    # home.packages = with pkgs; [
    # ];
  };
}
