{ stdenv
, lib
, fetchFromGitHub
, bison
, cmake
, flex
, pkg-config
}:

stdenv.mkDerivation rec {
  pname   = "vtr";
  version = "8.0.0-3340-g2dc5692e";

  src = fetchFromGitHub {
    owner  = "verilog-to-routing";
    repo   = "vtr-verilog-to-routing";
    rev    = "2dc5692e30f5e2e44c0bd9e3787bf13d68cb4adf";
    sha256 = "1rq7f1f3dzfm48a9vq5nvp0zllby0nasm3pvqab70f4jaq0m1aaa";
  };

  nativeBuildInputs = [
    bison
    cmake
    flex
    pkg-config
  ];

  cmakeFlags = [
    "-DWITH_ODIN=OFF"
    "-DWITH_ABC=OFF"
  ];

  doCheck = true;

  meta = with lib; {
    description = "SymbiFlow WIP changes for Verilog to Routing (VTR)";
    homepage    = "https://github.com/SymbiFlow/vtr-verilog-to-routing";
    platforms   = platforms.all;
  };
}
