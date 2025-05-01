{lib, ...}: {
  programs.wofi = {
    enable = lib.mkDefault true;

    settings = {
      width = 250;
      location = "center";
      allow-images = true;
    };
  };
}
