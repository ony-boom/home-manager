{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      gh = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };

      gh-work = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/bocasay_gh";
      };

      hizuru = {
        hostname = "94.250.201.16";
        setEnv = {
          TERM = "xterm-256color";
        };
      };
    };
  };
}
