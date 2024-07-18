{pkgs, ...}:{
	gtk = {
		enable = true;
		theme = {
			name = "Colloid-Everforest";
			package = pkgs.colloid-gtk-theme.override {
				scheme = ["everforest" "gruvbox" "catppuccin"];
			}
		}
	};
}
