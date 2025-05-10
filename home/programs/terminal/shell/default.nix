{
  imports = [
    ./prompt.nix
    ./zsh
    ./nu
  ];
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
