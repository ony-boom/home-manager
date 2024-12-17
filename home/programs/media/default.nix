{
  pkgs,
  nixGLWrap,
  config,
  ...
}: {
  home.packages = with pkgs; [
    playerctl
    (nixGLWrap {
      pkg = vlc;
      inherit config;
    })

    (nixGLWrap {
      pkg = stremio;
      inherit config;
    })

    (nixGLWrap {
      pkg = spotify;
      inherit config;
    })
  ];
}
