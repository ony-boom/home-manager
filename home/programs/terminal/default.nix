{pkgs, ...}: {
  imports = [
    ./shell
    ./emulator
    ./tmux
    ./neofetch
    ./lazygit.nix
    ./ssh.nix
  ];
  programs = {
    eza = {
      enable = true;
      icons = "always";
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
    jq.enable = true;
  };

  home.packages = with pkgs; [
    gum
    slides
    bottom
    neofetch
  ];
}
