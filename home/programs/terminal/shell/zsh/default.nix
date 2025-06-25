{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = lib.mkDefault true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
    };
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    shellAliases = {
      lg = "lazygit";
      kp = "killport";
      open = "xdg-open";
      hm = "home-manager";
      hms = "home-manager --impure switch -b backup";
    };

    dotDir = ".config/zsh";

    initContent = builtins.readFile ./main.zsh;
  };
}
