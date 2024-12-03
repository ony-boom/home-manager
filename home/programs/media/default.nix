{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    playerctl
    (config.lib.nixGL.wrap vlc)
  ];
}
