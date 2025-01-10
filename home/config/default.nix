{
  imports = [
    ./fonts.nix
  ];
  nixpkgs.config = {
    allowUnfree = true;
  };
}
