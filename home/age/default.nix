{config, ...}: {
  age = {
    identityPaths = ["${config.home.homeDirectory}/.ssh/agenix"];
    secrets = {
      mms.file = ./secrets/mms.age;
      cachix-secret.file = ./secrets/cachix-secret.age;
    };
  };
}
