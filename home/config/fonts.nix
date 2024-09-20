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
        name = "Hasklug Nerd Font";
        package = "Hasklig";
      };
			geist = {
				name = "GeistMono Nerd Font";
				package = "GeistMono";
			};
    };
  };
in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [fonts.monospace.iosevka.name];
    };
  };

  home.packages = with pkgs; [
    iosevka-matsuri
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
