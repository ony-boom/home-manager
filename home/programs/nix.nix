{pkgs, ...}: {
  nix = {
    package = pkgs.nix;
    settings = {
      substituters = [
        "https://cache.nixos.org/"
        "https://ony-boom.cachix.org"
      ];
      trusted-public-keys = [
        "ony-boom.cachix.org-1:rPOTyyOCiAhLarertCrNnZLxsBFpcirEekoohcCZt10="
      ];
    };
  };
}
