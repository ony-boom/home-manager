{
  pkgs,
  config,
  ...
}: {
  programs.wezterm = {
    enable = false;
    package = config.lib.nixGL.wrap pkgs.wezterm;
  };

  xdg.configFile."wezterm".source = ./config;
}
