{
  pkgs,
  self,
  ...
}: let
  cartographCFPackage = self + /packages/fonts/cartographCF.nix;
  fonts = {
    monospace = {
      jetbrains = {
        name = "JetBrainsMono Nerd Font";
      };
      cascadia = {
        name = "CaskaydiaCove Nerd Font";
      };
      iosevka = {
        name = "Iosevka Nerd Font";
      };
      hasklig = {
        name = "Hasklug Nerd Font";
      };
      geist = {
        name = "GeistMono Nerd Font";
      };
      cartographCF = {
        name = "CartographCF Nerd Font";
        package = pkgs.callPackage cartographCFPackage {inherit pkgs;};
      };
    };
  };

  nerdFonts = with pkgs.nerd-fonts; [
    jetbrains-mono
    caskaydia-cove
    hasklug
    geist-mono
    iosevka
  ];
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [fonts.monospace.cascadia.name];
    };
  };

  home.packages = with pkgs;
    [
      open-sans
      material-icons
      fonts.monospace.cartographCF.package
    ]
    ++ nerdFonts;
}
