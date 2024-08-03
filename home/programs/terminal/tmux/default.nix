{
  self,
  pkgs,
  ...
}: let
  defaultPackages = import "${self}/nix/defaultPackages.nix";
in {
  programs.tmux = {
    enable = defaultPackages.terminalEmulator != "kitty";
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
}
