let
  ony_maki = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF+IhjgxWSqhWo6ER2Gw4qyRb5JS7ioJIAKRZFJaId/y ony@maki";
in {
  "mms.age".publicKeys = [ony_maki];
}
