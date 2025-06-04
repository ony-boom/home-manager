{lib, ...}: {
  programs.fuzzel = {
    enable = lib.mkDefault true;
  };
}
