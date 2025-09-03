{
  username,
  config,
  pkgs,
  ...
}: let
  utils = import ./../lib/utils.nix {inherit config;};
in {
  imports = [
    ./age
    ./modules
    ./config
    ./programs
  ];

  xdg.configFile."nixpkgs/config.nix".text =
    /*
    nix
    */
    ''
      {
        allowUnfree = true;
        allowPredicate = pkg: true;
      }
    '';

  _module.args = {
    inherit utils;
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    shell = {
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      substituters = [
        "https://ony-boom.cachix.org"
      ];

      trusted-public-keys = [
        "ony-boom.cachix.org-1:rPOTyyOCiAhLarertCrNnZLxsBFpcirEekoohcCZt10="
      ];
    };
  };

  # enable desktop integrations
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.sessionVariables = {
    # Disable deno update checker
    GOPATH = "$HOME/go";
    DENO_NO_UPDATE_CHECK = 1;
    PNPM_HOME = "$HOME/.local/share/pnpm";
    BROWSER = "zen-browser";
    CACHIX_AUTH_TOKEN = "$(cat ${config.age.secrets.cachix-secret.path})";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/.deno/bin"
    "$PNPM_HOME"
    "$GOPATH/bin"
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.
}
