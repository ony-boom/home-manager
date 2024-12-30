{
  imports = [
    ./fonts.nix
    ./gtk
  ];
  nixpkgs.config = {
    allowUnfree = true;
  };
}
