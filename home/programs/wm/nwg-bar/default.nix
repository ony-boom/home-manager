{
  pkgs,
  utils,
  ...
}: {
  xdg.configFile."nwg-bar" = {
    source = utils.mkDots "/wm/nwg-bar/config";
    recursive = true;
  };

  home.packages = with pkgs; [
    nwg-bar
  ];
}
