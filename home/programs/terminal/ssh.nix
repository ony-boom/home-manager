{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "do-nixos" = {
        user = "root";
        hostname = "167.99.73.105";
      };
    };
  };
}
