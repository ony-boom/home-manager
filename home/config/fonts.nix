{pkgs, ...}: let
  nerdFonts = with pkgs.nerd-fonts; [
    meslo-lg
    jetbrains-mono
    caskaydia-mono
  ];

  mapleFonts = with pkgs; [
    maple-mono.truetype
    maple-mono.NF-unhinted
    maple-mono.NF-CN-unhinted
  ];

  monospacefontPriorities = {
    "Maple Mono NF" = 0;
    "CaskaydiaMono NF" = 1;
    "MesloLGS Nerd Font" = 2;
    "JetBrainsMono Nerd Font" = 4;
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
    ++ mapleFonts
    ++ nerdFonts;
}
