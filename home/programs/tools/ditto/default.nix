{
  utils,
  pkgs,
  ...
}: {
  xdg.configFile."ditto" = {
    source = utils.mkDots "/tools/ditto/config";
    recursive = true;
  };
  home.packages = with pkgs; [
    ditto
  ];
}
