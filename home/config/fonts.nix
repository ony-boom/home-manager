{
  pkgs,
  self,
  ...
}: let
  cartographCFPackage = self + /packages/fonts/cartographCF.nix;
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
        name = "Hasklug Nerd Font";
        package = "Hasklig";
      };
      geist = {
        name = "GeistMono Nerd Font";
        package = "GeistMono";
      };
      cartographCF = {
        name = "CartographCF Nerd Font";
        package = pkgs.callPackage cartographCFPackage {inherit pkgs;};
      };
    };
  };
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      # monospace = [fonts.monospace.iosevka.name];
      monospace = ["CartographCF Nerd Font"];
    };
  };

  home.packages = with pkgs; [
    open-sans
    material-icons
    iosevka-matsuri
    fonts.monospace.cartographCF.package
    (nerdfonts.override {
      fonts = [
        fonts.monospace.geist.package
        fonts.monospace.hasklig.package
        fonts.monospace.cascadia.package
        fonts.monospace.jetbrains.package
      ];
    })
  ];
}
