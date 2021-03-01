{ stdenv
, lib
, symlinkJoin
, buildDate
, commit
, bin
, devices ? []
}:

symlinkJoin rec {
  name   = "symbiflow-arch-defs";
  version = "${buildDate}-g${commit}";

  paths = [ bin ] ++ devices;

  meta = with lib; {
    description = "Project X-Ray - Xilinx Series 7 Bitstream Documentation";
    homepage    = "https://github.com/SymbiFlow/symbiflow-arch-defs";
    license     = licenses.isc;
    platforms   = platforms.all;
  };
}
