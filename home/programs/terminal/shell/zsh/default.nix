{lib, ...}: {
  programs.zsh = {
    enable = lib.mkDefault true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
    };
    syntaxHighlighting.enable = true;

    plugins = [
      /*
         {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
      */
    ];

    shellAliases = {
      lg = "lazygit";
      open = "xdg-open";
      nvim-dev = ''NVIM_APPNAME="nvim-dev" nvim'';
    };

    dotDir = ".config/zsh";

    initExtra = builtins.readFile ./main.zsh;
  };

  # xdg.configFile."zsh/completions".source = ./completions;
}
