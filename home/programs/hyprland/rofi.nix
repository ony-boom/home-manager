{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.wezterm}/bin/wezterm";
  };
}
