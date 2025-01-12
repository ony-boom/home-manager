{
  session.type = "wayland";
  nixGL = {
    defaultWrapper = "nvidia";
    installScripts = ["nvidia"];
  };
}
