{pkgs, ...}: {
  imports = [
    ./terminal
    ./programming
    ./editor
  ];
  programs = {
    git = {
      enable = true;
      userName = "Ony";
      userEmail = "onyrakoto27@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    font-manager
  ];
}
