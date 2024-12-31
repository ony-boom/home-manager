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

  version = "v7.0-beta33";
in
  pkgs.stdenv.mkDerivation {
    src = pkgs.fetchFromGitHub {
      owner = "subframe7536";
      repo = "maple-font";
      rev = version;
      inherit version;
      sha256 = "sha256-1vJArwIwe7ntJEly61htSnIPrms6CePWABl8IJOe1m8=";
    };
    name = "maple-font";
    inherit version;
    buildInputs = [ftcli pkgs.python3 pkgs.python3Packages.glyphslib];

    buildPhase = ''
      mkdir -p $out/share/fonts/truetype
      python3 build.py

      cp -r fonts/TTF/* $out/share/fonts/truetype
    '';
  }
