{ lib, config, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

   xdg.configFile."nvim".source = lib.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nvim";
}
