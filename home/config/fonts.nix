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
        name = "IosevkaMatsuriTerm Nerd Font";
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
    (nerdfonts.override {fonts = [fonts.monospace.jetbrains.package fonts.monospace.cascadia.package];})
  ];
}
