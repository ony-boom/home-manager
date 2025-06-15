{
  pkgs,
  config,
  lib,
  ...
}: let
  toolchain = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;
in {
  config = lib.mkIf config.programs.rust.enable {
    home.packages = [
      toolchain
      pkgs.rust-analyzer-unwrapped
    ];

    home.sessionVariables = {
      RUST_SRC_PATH = "${toolchain}/lib/rustlib/src/rust/library";
    };
  };
}
