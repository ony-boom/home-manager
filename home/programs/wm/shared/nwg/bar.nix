{pkgs}: let
  basePath = "${pkgs.nwg-bar}/share/nwg-bar/images";
  withBasePath = path: "${basePath}/${path}";
in [
  {
    label = "Lock";
    exec = "hyprlock --immediate";
    icon = withBasePath "system-lock-sceen.svg";
  }
  {
    label = "Logout";
    exec = "hyprctl dispatch exit";
    icon = withBasePath "system-log-out.svg";
  }
  {
    label = "Reboot";
    exec = "systemctl reboot";
    icon = withBasePath "system-reboot";
  }
  {
    label = "Shutdown";
    exec = "systemctl -i poweroff";
    icon = withBasePath "system-shutdown";
  }
]
