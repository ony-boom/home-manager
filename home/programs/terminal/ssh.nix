{
  programs.ssh = {
    enable = true;
		addKeysToAgent = "yes";
    matchBlocks = {
      "do-nixos" = {
        user = "root";
        hostname = "167.99.73.105";
      };
    };
  };
}
