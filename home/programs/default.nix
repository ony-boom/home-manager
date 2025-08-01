{
  pkgs,
  ...
}: {
  imports = [
    ./terminal
    ./programming
    ./text-editor
    ./media
    ./wm
    ./tools
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
    home-manager = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    font-manager
    typst
    emote
    cava
    cliphist
    httpie
    killport
    yazi
  ];
}
