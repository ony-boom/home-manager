{pkgs, ...}: let
  nerdFonts = with pkgs.nerd-fonts; [
    meslo-lg
    jetbrains-mono
    caskaydia-mono
  ];

  monospacefontPriorities = {
    "CaskaydiaMono NF" = 0;
    "MesloLGS Nerd Font" = 1;
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
