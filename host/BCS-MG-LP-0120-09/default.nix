{
  programs.zed-editor = {
    enable = false;
  };

  nixGL = {
    defaultWrapper = "mesa";
    installScripts = ["mesa"];
  };
}
