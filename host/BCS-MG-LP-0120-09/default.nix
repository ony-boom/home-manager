{
  nixGL = {
    defaultWrapper = "mesa";
    installScripts = ["mesa"];
  };

  services = {
    mpd.enable = false;
  };
}
