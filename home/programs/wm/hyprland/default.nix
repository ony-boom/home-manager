{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.hyprland.enable {
    xdg.configFile."hypr".source = ./hypr;
  };
}
