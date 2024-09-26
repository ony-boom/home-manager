{pkgs, ...}: {
  programs.tmux = {
    enable = false;
    baseIndex = 1;
    escapeTime = 10;
    mouse = true;
    prefix = "C-a";

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      tmuxPlugins.urlview
    ];
    extraConfig = builtins.readFile ./tmux.conf;
  };

  home.packages = [
    # better-tmux
  ];
}
