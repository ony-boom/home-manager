{
  pkgs,
  config,
  ...
}: let
  isXCompositor = config.xsession.windowManager.qtile.enable;
in {
  imports = [
    ./rofi
    ./qtile
  ];

  home.packages = pkgs.lib.optionals isXCompositor [
    pkgs.nitrogen
  ];
}
