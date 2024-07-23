{pkgs}: let
  default = import ../defaultPackages.nix;
  packages =
    [
      "nvm"
      "font-manager"
      "google-chrome"
      "jetbrains-toolbox"
      "vscode"
    ]
    ++ (with default; [
      terminalEmulator
    ]);

  hyprlandPackages = [
    "libva-nvidia-driver"
    "hyprland-git"
    "waybar"
    "swww"
    "dunst"
    "rofi-wayland"
    "nwg-look"
  ];

  scriptArgs = {extraPackages}: {
    PACKAGES = builtins.concatStringsSep " " (packages ++ extraPackages);
    HYPRLAND_PACKAGES = builtins.concatStringsSep " " (hyprlandPackages ++ extraPackages);
  };

  mkSetupScript = {
    distro,
    extraPackages ? [],
  }:
    pkgs.writeShellApplication {
      name = "setup";
      runtimeInputs = with pkgs; [git gum];
      text = builtins.readFile ./scripts/${distro}.sh;
      runtimeEnv = scriptArgs {inherit extraPackages;};
      # Just in case i choose to build the script instead of running it
      derivationArgs = scriptArgs {inherit extraPackages;};
    };
in {
  arch = mkSetupScript {distro = "arch";};
}
