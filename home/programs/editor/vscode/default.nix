{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.nixGL pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      eamodio.gitlens
      dbaeumer.vscode-eslint
      # sainnhe.everforest

      mvllow.rose-pine
      christian-kohler.path-intellisense
      aaron-bond.better-comments
      esbenp.prettier-vscode

      # gleam.gleam
      vscodevim.vim
      marp-team.marp-vscode
      adpyke.codesnap
      svelte.svelte-vscode
    ];
    userSettings = {
      "git.autofetch" = true;
      "files.autoSave" = "off";
      "window.menuBarVisibility" = "toggle";
      "workbench.iconTheme" = "moxer-icons";
      "workbench.colorTheme" = "Rosé Pine";
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
      "editor.fontSize" = 16;
    };
  };
}
