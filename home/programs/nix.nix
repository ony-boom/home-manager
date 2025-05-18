{
  xdg.configFile."nixpkgs/config.nix".text =
    /*
    nix
    */
    ''
      {
        allowUnfree = true;
        allowPredicate = pkg: true;
      }
    '';
}
