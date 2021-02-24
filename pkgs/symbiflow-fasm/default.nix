{ stdenv
, lib
, pkgs
, fetchFromGitHub
, buildPythonPackage
, textx
}:

buildPythonPackage rec {
  pname = "symbiflow-fasm";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "SymbiFlow";
    repo = "fasm";
    rev = "v${version}";
    sha256 = "1xa7f8slf8wvp1mfbfc3vdv61115p49k0vwngs4db6ips1qg1435";
  };

  propagatedBuildInputs = [ textx ];

  meta = with lib; {
    description = "FPGA Assembly (FASM) Parser and Generation library";
    homepage = "https://github.com/SymbiFlow/fasm";
    license = licenses.isc;
  };
}
