{ stdenv
, lib
, fetchFromGitHub
, yosys
, zlib
, readline
}:

stdenv.mkDerivation rec {
  pname   = "symbiflow-yosys-plugins";
  version = "1.0.0.7-248-ga604f9f2";

  src = fetchFromGitHub {
    owner  = "SymbiFlow";
    repo   = "yosys-symbiflow-plugins";
    rev    = "a604f9f2f1122beb06727dc7503c72d34839b91c";
    sha256 = "0q9r31p7fy4ylfrwvwlbivq5a03xrph34blxbxzx2c8bc02mbv0s";
  };

  enableParallelBuilding = true;

  nativeBuildInputs = [ yosys ];

  buildInputs = [
    readline
    zlib
  ];

  makeFlags = [ "PLUGINS_DIR=$(out)/share/yosys/plugins" ];

  meta = with lib; {
    description = "Yosys SymbiFlow Plugins";
    homepage    = "https://github.com/SymbiFlow/yosys-symbiflow-plugins";
    license     = licenses.isc;
    platforms   = platforms.all;
  };
}
