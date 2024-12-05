{pkgs}: {
  pkg,
  config,
}:
if config.isNixOS
then pkg
else config.lib.nixGL.wrap pkg
