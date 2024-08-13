{pkgs, ...}: let
  toolchain = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;
in {
  home.packages = [
    # pkgs.rustup
    toolchain
    # We want the unwrapped version, "rust-analyzer" (wrapped) comes with nixpkgs' toolchain
    pkgs.rust-analyzer-unwrapped
  ];

  home.sessionVariables = {
    RUST_SRC_PATH = "${toolchain}/lib/rustlib/src/rust/library";
  };
}
