{pkgs, ...}: let
  fonts = {
    monospace = {
      jetbrains = {
        package = "JetBrainsMono";
        name = "JetBrainsMono Nerd Font";
      };
      cascadia = {
        package = "CascadiaCode";
        name = "CaskaydiaCove Nerd Font";
      };
      zed = {
        package = "ZedMono";
        name = "ZedMono Nerd Font Mono";
      };
    };
  };
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [fonts.monospace.jetbrains.name];
    };
  };

  home.packages = with pkgs; [
    (nerdfonts.override {fonts = [fonts.monospace.jetbrains.package fonts.monospace.cascadia.package fonts.monospace.zed.package];})
  ];
}
