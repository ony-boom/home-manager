{
  config,
  lib,
  ...
}: {
  services.mms = {
    enable = lib.mkDefault true;
    sessionSecretFile = config.age.secrets.mms.path;
  };
}
