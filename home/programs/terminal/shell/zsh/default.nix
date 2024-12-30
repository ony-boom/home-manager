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
      plugins = [
        "tmux"
      ];
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
      open = "xdg-open";
    };

    dotDir = ".config/zsh";

    initExtra = builtins.readFile ./main.zsh;
  };

  # xdg.configFile."zsh/completions".source = ./completions;
}
