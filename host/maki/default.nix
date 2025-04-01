{pkgs, lib, ...}: {
  nixGL = {
    defaultWrapper = "nvidia";
    installScripts = ["nvidia"];
  };

  programs.rust.enable = lib.mkDefault true;

  home.packages = with pkgs; [
    scrcpy
    font-manager
    cava
  ];
}
