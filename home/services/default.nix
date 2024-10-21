{
  services = {
    gnome-keyring = {
      enable = true;
      components = ["pkcs11" "secrets" "ssh"];
    };
    ssh-agent.enable = true;
  };
}
