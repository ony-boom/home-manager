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
    };
  };
}
