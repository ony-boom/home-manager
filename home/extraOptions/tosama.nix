{
  lib,
  config,
  ...
}: {
  gpuType = "nvidia";
  useWayland = false;

  home.sessionVariables = lib.mkIf config.useWayland {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    ENABLE_VKBASALT = 1;
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = 1;
  };
}
