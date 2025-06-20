{lib, ...}: {
  programs.distrobox = {
    enable = lib.mkDefault true;
    containers = {
      yuno = {
        image = "archlinux:latest";
      };
    };
  };
}
