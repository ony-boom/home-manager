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
      iosevka = {
        name = "Iosevka Matsuri Term";
      };
      hasklig = {
        name = "Hasklug";
        package = "Hasklug Nerd Font";
      };
    };
  };
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      # monospace = [fonts.monospace.jetbrains.name];
      monospace = [fonts.monospace.iosevka.name];
    };
  };

  home.packages = with pkgs; [
    iosevka-matsuri
    (nerdfonts.override {
      fonts = [
        fonts.monospace.hasklig.package
        fonts.monospace.cascadia.package
        fonts.monospace.jetbrains.package
      ];
    })
  ];
}
