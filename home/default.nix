{
  username,
  config,
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
    GOPATH = "$HOME/go";
    # Disable deno update checker
    DENO_NO_UPDATE_CHECK = 1;
    # NIXPKGS_ALLOW_INSECURE = 1;
    PNPM_HOME = "$HOME/.local/share/pnpm";
    COMPOSER_PATH = "$XDG_CONFIG_HOME/composer";
    CACHIX_AUTH_TOKEN = "$(cat ${config.age.secrets.cachix-secret.path})";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/.deno/bin"
    "$HOME/.cache/.bun/bin"
    "$PNPM_HOME"
    "$GOPATH/bin"
    "$COMPOSER_PATH/vendor/bin"
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.
}
