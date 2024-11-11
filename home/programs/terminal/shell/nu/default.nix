{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    shellAliases = {
      lg = "lazygit";
    };
  };
}
