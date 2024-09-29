{
  isNixOS = true;

  programs = {
    chrome.enable = true;
  };

	# wayland.windowManager.hyprland.enable = true;

  home.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
