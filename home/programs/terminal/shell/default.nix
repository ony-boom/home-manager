{
    imports = [
        ./prompt.nix
    ];
    programs.zsh = {
        enable = true;
        oh-my-zsh.enable = true;
        syntaxHighlighting.enable = true;

				shellAliases = {
					lg = "lazygit";
				};
    };
}
