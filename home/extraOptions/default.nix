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
  };

  imports = [
    ./${host}.nix
  ];
}
