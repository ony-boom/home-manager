{pkgs, ...}: {
  nixGL = {
    defaultWrapper = "mesa";
    installScripts = ["mesa"];
  };

  programs.rofi.package = pkgs.rofi-wayland;

  services = {
    mpd.enable = false;
  };
}
