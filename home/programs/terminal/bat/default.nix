{
  programs.bat = {
    enable = true;
		config = {
			theme = "everforest-soft";
		};
    themes = {
      everforest-soft = builtins.readFile ./themes/everforest-soft.tmTheme;
    };
  };
}
