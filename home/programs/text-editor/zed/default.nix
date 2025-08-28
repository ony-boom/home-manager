{utils, ...}: {
  xdg.configFile."zed" = {
    source = utils.mkDots "/text-editor/zed/config";
    recursive = true;
  };
}
