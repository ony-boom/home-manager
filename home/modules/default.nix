{lib, ...}: {
  options = {
    programs.rust.enable = lib.mkEnableOption "Enable Rust programming";
  };
}
