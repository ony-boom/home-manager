{
	services.ssh-agent.enable = true;
	services.gnome-keyring = {
		enable = true;
		components = ["pkcs11" "secrets" "ssh"];
	};
}
