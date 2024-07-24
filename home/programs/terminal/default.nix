{
  pkgs,
  ...
}: {
  imports = [
    ./shell
    ./emulator
    ./tmux
    ./neofetch
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
    fzf.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    lazygit.enable = true;
  };

  home.packages = with pkgs; [
    neofetch
  ];
}
