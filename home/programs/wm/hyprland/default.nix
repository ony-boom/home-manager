{
  utils,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.programs.hypr.enable {
    xdg.configFile = {
      "hypr" = {
        source = utils.mkDots "/wm/hyprland/hypr";
        recursive = true;
      };

      "hyprpanel" = {
        source = utils.mkDots "/wm/hyprland/hyprpanel";
        recursive = true;
      };
    };
  };
}
