{
  lib,
  config,
  ...
}: {
  options = {
    session = {
      type = lib.mkOption {
        type = lib.types.enum ["wayland" "x11"];
        default = "wayland";
        description = "The language protocol to use for the session";
      };
      isWayland = lib.mkOption {
        type = lib.types.bool;
        default = config.session.type == "wayland";
        description = "Whether to use Wayland for the session";
      };
    };
  };
}
