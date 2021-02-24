{ stdenv
, lib
, buildPythonPackage
, fetchPypi
, pytestCheckHook
, arpeggio
, click
, jinja2
}:

buildPythonPackage rec {
  pname = "textX";
  version = "2.3.0";

  src = fetchPypi {
    inherit pname;
    inherit version;
    sha256 = "00lwd588ms96qp27m5vpjkzk30wfw53hnmv8y77slxca8lw9vq82";
  };

  checkInputs = [ pytestCheckHook ];

  pytestFlagsArray = [ "tests/functional" ];

  propagatedBuildInputs = [
    arpeggio
    click
    jinja2
  ];

  meta = with lib; {
    description = "textX is a meta-language for building Domain-Specific Languages (DSLs) in Python";
    homepage = "https://textx.github.io";
    license = licenses.mit;
  };
}
