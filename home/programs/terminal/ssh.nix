{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      hizuru = {
        addKeysToAgent = "yes";
        hostname = "94.250.201.16";
        setEnv = {
          TERM = "xterm-256color";
        };
      };
    };
  };
}
