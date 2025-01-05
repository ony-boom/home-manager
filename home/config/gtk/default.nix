{pkgs, ...}: {
  home.pointerCursor = {
    size = 24;
    gtk.enable = true;
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
  };
  gtk = {
    enable = true;
    # INFO: Do not forget to install it, nix does not have it and I am lazy to package it
    theme.name = "Rosepine-Dark";
    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
      extraCss = builtins.readFile ./gtk.css;
    };
  };

  home.sessionVariables = {
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
  };
}
