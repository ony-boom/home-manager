{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "ina" = {
        user = "ony";
        hostname = "128.199.228.20";
      };
    };
  };
}
