{username, ...}: {
  imports = [
    ./modules
    ./config
    ./programs
  ];
  # nixpks config
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
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
    DENO_NO_UPDATE_CHECK = 1;
    PNPM_HOME = "$HOME/.local/share/pnpm";
    # Disable auto pinning of JS package managers
    COREPACK_ENABLE_AUTO_PIN = 0;

    ANDROID_HOME = "$HOME/Android/Sdk";
    VOLTA_HOME = "$HOME/.volta";
    ENCORE_INSTALL = "/home/ony/.encore";
    GOPATH = "$HOME/go";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/.deno/bin"
    "$HOME/.local/share/pnpm"
    "$ANDROID_HOME/emulator"
    "$ANDROID_HOME/platform-tools"
    "$VOLTA_HOME/bin"
    "$ENCORE_INSTALL/bin"
    "$GOPATH/bin"
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.
}
