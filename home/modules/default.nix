{lib, ...}: {
  imports = [
    ./nixGL.nix
  ];
  options = {
    programs.rust.enable = lib.mkEnableOption "Enable Rust programming";
  };
}
