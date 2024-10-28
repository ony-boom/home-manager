{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./browser
    ./terminal
    ./programming
    ./editor
    ./media
    ./wm
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

  home.packages = with pkgs;
    [
      nh
      emote
      scrcpy
      obsidian
      font-manager
    ]
    ++ (
      if config.programs.chrome.enable
      then [
        google-chrome
      ]
      else []
    );
}
