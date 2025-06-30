# Install qtile through system's package manager, installing it through nix is quite problematic or it's just a skill issue xD.
{
  utils,
  pkgs,
  ...
}: {
  xdg.configFile = {
    "qtile" = {
      source = utils.mkDots "/wm/qtile/config";
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    nitrogen
  ];
}
