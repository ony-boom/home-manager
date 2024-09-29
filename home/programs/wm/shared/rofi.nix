{
  pkgs,
  config,
  ...
}: {
  programs.rofi = {
    enable = true;
    package =
      if config.useWayland
      then pkgs.rofi-wayland
      else pkgs.rofi;
  };
}
