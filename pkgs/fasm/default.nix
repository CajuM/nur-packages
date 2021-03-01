{ stdenv
, lib
, pkgs
, fetchPypi
, buildPythonPackage
, cython
, textx
}:

buildPythonPackage rec {
  pname = "fasm";
  version = "0.0.2.post67";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1m0hvww3f7iml5jn5d9d14pgm73z0iwpqci77d02n4hqb3a5i0jy";
  };

  nativeBuildInputs = [
    cython
  ];

  dontConfigure = true;

  propagatedBuildInputs = [
    textx
  ];

  doCheck = false;

  meta = with lib; {
    description = "FPGA Assembly (FASM) Parser and Generation library";
    homepage = "https://github.com/SymbiFlow/fasm";
    license = licenses.isc;
  };
}
