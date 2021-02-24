{ stdenv
, lib
, fetchFromGitHub
, buildPythonPackage
, pytestCheckHook
, simplejson
, intervaltree
, python-prjxray
, symbiflow-fasm
, textx
}:

buildPythonPackage rec {
  pname = "xc-fasm";
  version = "0.0.1-ge12f3133";

  src = fetchFromGitHub {
    owner = "SymbiFlow";
    repo = "xc-fasm";
    rev = "e12f31334e96fedf3af86d13cf51f70ad2270f5f";
    sha256 = "13bzw92sx99s0zldr48na4yhrnp7b90nxsd8ya6ag1pvvijp2al4";
  };

  propagatedBuildInputs = [
    simplejson
    intervaltree
    python-prjxray
    symbiflow-fasm
    textx
  ];

  # Pip will check for and then install missing dependecies.
  # Because some of them are installed from git, it will try
  # to download them even if they're present in
  # propagatedBuildInputs.
  pipInstallFlags = [ "--no-deps" ];

  checkInputs = [ pytestCheckHook ];

  meta = with lib; {
    description = "XC FASM libraries";
    homepage = "https://github.com/SymbiFlow/xc-fasm";
    license = licenses.isc;
  };
}
