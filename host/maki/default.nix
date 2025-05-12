{pkgs, ...}: {
  nixGL = {
    defaultWrapper = "nvidia";
    installScripts = ["nvidia"];
  };

  home.packages = with pkgs; [
    scrcpy
    cava
  ];
}
