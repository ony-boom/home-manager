{pkgs, ...}: {
  xdg.configFile."gtk-3.0/gtk.css".source = ./gtk.css;

  gtk = {
    # INFO: Do not forget to install it, nix does not have it and I am lazy to package it
    theme.name = "Rosepine-Dark";
    cursorTheme = {
      size = 24;
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
    };
  };
}
