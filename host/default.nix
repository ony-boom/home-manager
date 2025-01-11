{
  hostname,
  lib,
  ...
}: {
  imports =
    lib.optional (builtins.pathExists ./${hostname}) ./${hostname}
    ++ [
    ];
}
