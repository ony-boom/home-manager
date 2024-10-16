{
  stablePkgs,
  pkgs,
  ...
}: {
  isNixOS = true;
  useWM = true;

  programs = {
    chrome.enable = true;
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
