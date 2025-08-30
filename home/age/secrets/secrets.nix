let
  agenix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHq8bcOlccMFzKUaDy8qp46jkHnNcq690Q/ECYAbjS0a ony@maki";
in {
  "mms.age".publicKeys = [agenix];
  "cachix-secret.age".publicKeys = [agenix];
}
