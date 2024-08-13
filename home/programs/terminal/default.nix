{pkgs, ...}: {
  imports = [
    ./shell
    ./emulator
    ./tmux
    ./neofetch
    ./lazygit.nix
  ];
  programs = {
    eza = {
      enable = true;
      icons = true;
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
    fd.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
  };

  home.packages = with pkgs; [
    slides
    delta
    neofetch
  ];
}
