{lib, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = lib.readFile ./init.lua;
  };

  xdg.configFile."nvim/lua".source = ./lua;
}
