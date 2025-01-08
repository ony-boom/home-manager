{pkgs}:
pkgs.stdenv.mkDerivation {
  src = ./.;
  name = "monolisa-font";

  buildInputs = [pkgs.unzip];

  buildPhase = ''
    mkdir -p $out/share/fonts/truetype
  '';

  installPhase = ''
    unzip -o MonoLisa.zip -d $out/share/fonts/truetype
  '';
}
