let
  defaultPackages = import ../../../../nix/defaultPackages.nix;
in {
  programs.tmux = {
    enable = defaultPackages.terminalEmulator != "kitty";
    baseIndex = 1;
    escapeTime = 10;
    mouse = true;
    prefix = "C-a";
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
