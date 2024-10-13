{
  isNixOS = true;
  useWM = true;

  programs = {
    chrome.enable = true;
    hyprland.enable = false;
  };

  home.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
