{ config, pkgs,... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

   xdg.configFile."nvim" = {
     source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Repos/mine/neovim-config";
     recursive = true;
   };

   home.packages = with pkgs; [
      alejandra
      stylua
      prettierd
   ];
}
