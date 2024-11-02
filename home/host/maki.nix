{
  stablePkgs,
  pkgs,
  ...
}: {
  isNixOS = true;
  useWM = true;

  programs = {
    chrome.enable = true;
    waybar = {
      settings = {
        mainBar = {
          modules-center = [
            "clock"
          ];
          "hyprland/workspaces" = {
            persistent-workspaces = {
              HDMI-A-1 = 2;
            };
          };
        };
      };
    };
  };

  home.packages = with pkgs; [
    nautilus
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = stablePkgs.hyprland;

    settings = {
      monitor = [
        ",preferred,auto,auto"
        "Unknown-1,disable"
      ];
    };
  };
}
