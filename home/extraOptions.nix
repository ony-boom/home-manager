{
  lib,
  host,
  ...
}: {
  options = {
    gpuType = lib.mkOption {
      type = with lib.types; enum ["intel" "nvidia"];
      description = "Which gpu host use";
      default = "nvidia";
    };
    useWayland = lib.mkOption {
      type = with lib.types; bool;
      description = "If use wayland";
      default = false;
    };
  };

  imports = [
    ./${host}.nix
  ];
}
