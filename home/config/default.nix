{
  imports = [
    ./fonts.nix
  ];
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-24.8.6"
    ];
  };
}
