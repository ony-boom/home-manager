{pkgs, ...}: {
  imports = [
    ./terminal
    ./programming
    ./editor
    ./media
  ];
  programs = {
    git = {
      enable = true;
      userName = "Ony";
      userEmail = "onyrakoto27@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };

    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    emote
    scrcpy
    obsidian
    google-chrome
  ];
}
