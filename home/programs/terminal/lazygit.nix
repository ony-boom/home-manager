{
  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        selectedLineBgColor = ["underline"];
      };
      git.paging = {
        colorArg = "always";
        # pager = "delta  --dark --paging=never";
      };
    };
  };
}
