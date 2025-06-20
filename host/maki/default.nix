{pkgs, ...}: {
  nixGL = {
    defaultWrapper = "nvidia";
    installScripts = ["nvidia"];
  };

  programs.distrobox.enable = false;

  home.packages = with pkgs; [
    scrcpy
    cava
  ];
}
