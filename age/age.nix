{config, ...}: {
  age = {
    identityPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
    secrets = {
      mms = {
        file = ./secrets/mms.age;
      };
    };
  };
}
