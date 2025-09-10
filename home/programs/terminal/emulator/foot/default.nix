{utils, ...}: {
  xdg.configFile."foot" = {
    source = utils.mkDots "/terminal/emulator/foot/config";
    recursive = true;
  };
}
