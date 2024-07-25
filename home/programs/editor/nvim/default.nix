{lib, pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = lib.readFile ./init.lua;
  };

	# Mason replacement
	home.packages = with pkgs; [
		# lua
		stylua
		lua-language-server
	];

  xdg.configFile."nvim/lua".source = ./lua;
}
