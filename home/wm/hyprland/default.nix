{
  # hyprland related packages/programs/services
  # hyprland is installed via yay (can't make it works properly with nix)
  imports = [
    ./programs
  ];
  xdg.configFile."hypr".source = ./config;
}
