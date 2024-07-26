{pkgs}: let
  packages = [
    "nvm"
    "google-chrome"
    "jetbrains-toolbox"
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
      # Just in case i choose to build the script instead of running it
      derivationArgs = scriptArgs {inherit extraPackages;};
    };
in {
  arch = mkSetupScript {distro = "arch";};
}
