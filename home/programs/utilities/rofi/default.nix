{
	programs.rofi = {
		enable = false;
		font = "Noto Sans 14";

		extraConfig = {
			show-icons = true;
		};
	};

  xdg.configFile."rofi/themes".source = ./themes;
}

