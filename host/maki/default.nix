{pkgs, ...}: {
  nixGL = {
    defaultWrapper = "nvidia";
    installScripts = ["nvidia"];
  };

  xsession.windowManager.qtile.enable = true;

  programs.distrobox.enable = false;

  home.packages = with pkgs; [
    scrcpy
    cava
  ];
}
