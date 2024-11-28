{
  imports = [
    ./fonts.nix
    ./gtk
  ];

  nix.config = {
    allowUnfree = true;
  };
}
