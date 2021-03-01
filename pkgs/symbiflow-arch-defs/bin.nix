{ stdenv
, lib
, fetchurl
, python3Packages
, buildNum
, buildDate
, commit
, sha256
}:

stdenv.mkDerivation rec {
  pname   = "symbiflow-arch-defs-bin";
  version = "${buildDate}-g${commit}";

  src = fetchurl {
    inherit sha256;
    url = "https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/${buildNum}/${buildDate}/symbiflow-arch-defs-install-${commit}.tar.xz";
  };

  sourceRoot = ".";

  propagatedBuildInputs = [
  ];

  installPhase = ''
    mkdir -p $out
    cp -r bin share $out/
  '';
}
