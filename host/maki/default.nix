{pkgs, ...}: {
  nixGL = {
    defaultWrapper = "nvidia";
    installScripts = ["nvidia"];
  };

  home.packages = with pkgs; [
    wofi
    scrcpy
    font-manager
    cava
  ];
}
