{pkgs, ...}: {
  gtk = {
    enable = true;
    # INFO: Do not forget to install it, nix does not have it and I am lazy to package it
    theme.name = "Rosepine-Dark";
    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
    cursorTheme = {
      size = 24;
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
    };

    gtk3.extraCss = builtins.readFile ./gtk.css;
  };
}
