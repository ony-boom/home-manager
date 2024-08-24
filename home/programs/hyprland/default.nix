{
  lib,
  config,
  ...
}: let
  cfg = config.programs.hyprland;
in {
  options = {
    programs.hyprland.enable = true;
  };

  config = lib.mkIf cfg.enable {
		imports = [
			./hyprland.nix
		];
	};
}
