{pkgs}: let
  packages = [
    "nvm"
    "tailscale"
    "google-chrome"
    "jetbrains-toolbox"
    "rose-pine-gtk-theme-full"
  ];

  scriptArgs = {extraPackages}: {
    PACKAGES = builtins.concatStringsSep " " (packages ++ extraPackages);
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
    };
in {
  arch = mkSetupScript {distro = "arch";};
}
