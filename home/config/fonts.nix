{pkgs, ...}: let
  nerdFonts = with pkgs.nerd-fonts; [
    jetbrains-mono
    caskaydia-mono
    fira-code
    hasklug
  ];

  mapleFonts = with pkgs; [
    maple-mono.truetype
    maple-mono.NF-unhinted
    maple-mono.NF-CN-unhinted
  ];

  monospaces = [
    "Hasklug Nerd Font Mono"
    "Maple Mono NF"
    "FiraCode Nerd Font"
    "CaskaydiaMono NF"
    "JetBrainsMono Nerd Font"
  ];
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = monospaces;
    };
  };

  home.packages = with pkgs;
    [
      cantarell-fonts
    ]
    ++ mapleFonts
    ++ nerdFonts;
}
