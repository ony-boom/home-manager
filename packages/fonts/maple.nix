{pkgs}: let
  ftcli = pkgs.python3Packages.buildPythonPackage rec {
    pname = "FoundryTools-CLI";
    version = "1.1.22";

    src = pkgs.fetchFromGitHub {
      owner = "ftcli";
      repo = pname;
      rev = "v${version}";
      sha256 = "sha256-QubB+GnZAxEhys6/Qx/ve2g/IXSBP9ierOMR+Gw2QOg=";
    };

    # TODO: use the project requirements.txt to generate the buildInputs

    dependencies = with pkgs.python3Packages; [
      afdko
      fonttools
      brotli
      click
      cffsubr
      dehinter
      loguru
      pathvalidate
      rich
      skia-pathops
      ttfautohint-py
      zopfli
    ];
  };

  version = "v7.0-beta32";
in
  pkgs.stdenv.mkDerivation {
    src = pkgs.fetchFromGitHub {
      owner = "subframe7536";
      repo = "maple-font";
      rev = version;
      inherit version;
      sha256 = "sha256-A8Ekk7tFJrzhFIFx+E6NjQy7rcSGu38ZNr+xCxO8qNE=";
    };
    name = "maple-font";
    version = "v7.0-beta32";
    buildInputs = [ftcli pkgs.python3];

    buildPhase = ''
      mkdir -p $out/share/fonts/truetype
      python3 build.py

      cp -r fonts/TTF/* $out/share/fonts/truetype
    '';
  }
