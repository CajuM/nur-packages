{ stdenv
, lib
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname   = "prjxray-db";
  version = "0.0-245-ge7663ba6";

  src = fetchFromGitHub {
    owner  = "SymbiFlow";
    repo   = "prjxray-db";
    rev    = "e7663ba6eb651a7255775c7dca4e32483a8cd9fb";
    sha256 = "0q75xig16dbgh3nfygggir0a160x52y766h7hd9xcib9m88jixb2";
  };

  enableParallelBuilding = true;

  installPhase = ''
    runHook preInstall

    DBDIR="$out/share/symbiflow/prjxray-db/"
    DB_CONFIG="$out/bin/prjxray-config"

    mkdir -p $DBDIR $out/bin

    for device in artix7 kintex7 zynq7; do
      cp -r $src/$device $DBDIR
    done

    echo -e "#!/bin/sh\n\necho $DBDIR" > $DB_CONFIG
    chmod +x $DB_CONFIG

    runHook postInstall
  '';

  meta = with lib; {
    description = "Project X-Ray - Xilinx Series 7 Bitstream Documentation";
    homepage    = "https://github.com/SymbiFlow/prjxray-db";
    license     = licenses.cc0;
    platforms   = platforms.all;
  };
}
