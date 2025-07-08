{
  nixGL = {
    defaultWrapper = "mesa";
    installScripts = ["mesa"];
  };

  
  programs.zed-editor.enable = false;

  services = {
    mpd.enable = false;
  };
}
