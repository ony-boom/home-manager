{
  imports = [
    ./prompt.nix
    ./zsh
    ./nu
  ];
  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };
}
