{pkgs, ...}: let
  nerdFonts = with pkgs.nerd-fonts; [
    jetbrains-mono
    zed-mono
    meslo-lg
  ];

  monospacefontPriorities = {
    "MesloLGL Nerd Font" = 0;
    "ZedMono NF" = 1;
    "JetBrainsMono Nerd Font" = 2;
  };

  monospaces = builtins.sort (a: b: monospacefontPriorities.${a} < monospacefontPriorities.${b}) (builtins.attrNames monospacefontPriorities);
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = monospaces;
    };
  };

  home.packages = with pkgs;
    [
      open-sans
    ]
    ++ nerdFonts;
}
