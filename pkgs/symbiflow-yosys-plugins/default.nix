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
    sha256 = "03gkma4inwpl609dzkfk6aqs12wvy1ssz8h5g8x8w745gxsj2995";
  };

  enableParallelBuilding = true;

  nativeBuildInputs = [ yosys ];

  buildInputs = [
    readline
    zlib
  ];

  patchPhase = ''
    substituteInPlace xdc-plugin/xdc.cc \
      --replace 'proc_share_dirname()' "std::string(\"$out/share/yosys\")"
  '';

  makeFlags = [ "PLUGINS_DIR=$(out)/share/yosys/plugins" ];

  meta = with lib; {
    description = "Yosys SymbiFlow Plugins";
    homepage    = "https://github.com/SymbiFlow/yosys-symbiflow-plugins";
    license     = licenses.isc;
    platforms   = platforms.all;
  };
}
