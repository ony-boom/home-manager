{pkgs, ...}: let
  nerdFonts = with pkgs.nerd-fonts; [
    jetbrains-mono
  ];
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["JetBrainsMono Nerd Font"];
    };
  };

  home.packages = with pkgs;
    [
      open-sans
    ]
    ++ nerdFonts;
}
