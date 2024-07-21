{
  programs.tmux = {
    enable = false;
    baseIndex = 1;
    escapeTime = 10;
    mouse = true;
    prefix = "C-a";
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
