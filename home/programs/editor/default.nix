{pkgs, ...}: {
  imports = [./nvim];

  home.packages = with pkgs; [
    vscode
  ];
}
