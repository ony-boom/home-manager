{pkgs, ...}: {
  imports = [
    ./rofi
  ];

  home.packages = [
    pkgs.nitrogen
  ];
}
