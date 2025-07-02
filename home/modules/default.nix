{lib, ...}: {
  imports = [
    ./nixGL.nix
  ];
  options = {
    programs.rust.enable = lib.mkEnableOption "Enable Rust programming";
    programs.hypr.enable = lib.mkEnableOption "Enable Qtile window manager";
    programs.picom.enable = lib.mkEnableOption "Enable Picom compositor";
    xsession.windowManager.qtile.enable = lib.mkEnableOption "Enable Qtile window manager";
  };
}
