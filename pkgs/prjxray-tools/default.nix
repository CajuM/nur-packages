{ stdenv
, lib
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname   = "prjxray-tools";
  version = "0.1-2836-gf3028e15";

  src = fetchFromGitHub {
    owner  = "SymbiFlow";
    repo   = "prjxray";
    fetchSubmodules = true;
    rev    = "f3028e157e5f554e085af2a58247e2c8c7be0f3b";
    sha256 = "19g7dk12hdhip821crwinncp8vgyzs0r85l1h2vbgn61lnxc7f4h";
  };

  nativeBuildInputs = [ cmake ];

  doCheck = true;

  meta = with lib; {
    description = "Documenting the Xilinx 7-series bit-stream format";
    homepage    = "https://github.com/SymbiFlow/prjxray";
    license     = licenses.isc;
    platforms   = platforms.all;
  };
}
