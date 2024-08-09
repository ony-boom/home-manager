{
  self,
  pkgs,
  # system,
  ...
}: let
  defaultPackages = import "${self}/nix/defaultPackages.nix";
  # better-tmux = import ./better-tmux.nix {inherit pkgs system;};
in {
  programs.tmux = {
    enable = defaultPackages.terminalEmulator == "alacritty";
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
