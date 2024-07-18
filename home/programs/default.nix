{
  imports = [
    ./terminal
    ./programming
    ./editor
  ];
  programs = {
    # Let Home Manager install and manage itself.
    git = {
			enable = true;
      userName = "Ony";
      userEmail = "onyrakoto27@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    home-manager.enable = true;
  };
}
