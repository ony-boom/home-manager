{
  nixGL = {
    defaultWrapper = "mesa";
    installScripts = ["mesa"];
  };

  programs.zed-editor.enable = false;
  programs.waybar.settings.main.outputs = ["eDP-1"];

  services = {
    mpd.enable = false;
  };
}
