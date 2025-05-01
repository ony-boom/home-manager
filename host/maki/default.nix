{pkgs, ...}: {
  nixGL = {
    defaultWrapper = "nvidia";
    installScripts = ["nvidia"];
  };

  programs.wofi.enabled = true;

  home.packages = with pkgs; [
    scrcpy
    font-manager
    cava
  ];
}
