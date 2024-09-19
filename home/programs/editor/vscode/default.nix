{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      eamodio.gitlens
      dbaeumer.vscode-eslint
      # sainnhe.everforest

      mvllow.rose-pine
      christian-kohler.path-intellisense
      aaron-bond.better-comments
      esbenp.prettier-vscode
      # equinusocio.moxer-icons

      # gleam.gleam

      marp-team.marp-vscode
      adpyke.codesnap
      svelte.svelte-vscode
    ];
    userSettings = {
      "git.autofetch" = true;
      "files.autoSave" = "off";
      "window.menuBarVisibility" = "toggle";
      "workbench.iconTheme" = "moxer-icons";
      "workbench.colorTheme" = "Everforest Dark";
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[css]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[svelte]" = {
        "editor.defaultFormatter" = "svelte.svelte-vscode";
      };

      "svelte.enable-ts-plugin" = true;
      # "editor.fontWeight" = 600;
      "editor.fontLigatures" = "'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum'";
    };
  };
}
