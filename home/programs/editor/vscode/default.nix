{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      eamodio.gitlens
      dbaeumer.vscode-eslint
      # sainnhe.everforest
      christian-kohler.path-intellisense
      aaron-bond.better-comments
      esbenp.prettier-vscode
      # equinusocio.moxer-icons
    ];
    userSettings = {
      "git.autofetch" = true;
      "files.autoSave" = "off";
      "editor.fontLigatures" = true;
      "window.menuBarVisibility" = "toggle";
      "workbench.iconTheme" = "moxer-icons";
      "workbench.colorTheme" = "Everforest Dark";
    };
  };
}
