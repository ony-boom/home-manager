{
  imports = [
    ./prompt.nix
    ./zsh
  ];
  programs.carapace = {
    enable = true;
  };
}
