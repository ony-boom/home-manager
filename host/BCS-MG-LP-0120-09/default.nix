{
  nixGL = {
    defaultWrapper = "mesa";
    installScripts = ["mesa"];
  };

  programs.zed-editor.enable = false;
  programs.waybar.settings.main = {
    output = ["eDP-1"];
  };
}
