{pkgs, ...}: {
  nixGL = {
    defaultWrapper = "nvidia";
    installScripts = ["nvidia"];
  };

  programs.rust.enable = true;

  home.packages = with pkgs; [
    scrcpy
    font-manager
    cava
  ];
}
