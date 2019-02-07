{ lib
, buildPythonPackage
, fetchPypi
, six
, marshmallow
, coverage
, coveralls
, flake8
, pytest
, pytestcov
, tox
}:

buildPythonPackage rec {
  pname = "marshmallow-polyfield";
  version = "4.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "20a80bf2e81f7a42f0bdab32610dc6a890d44b18b123d4b084a41b1476537662";
  };

  propagatedBuildInputs = [ 
    six
    marshmallow
  ];

  checkInputs = [
    coverage
    coveralls
    flake8
    pytest
    pytestcov
    tox
  ];

  meta = {
    homepage = "https://github.com/Bachmann1234/marshmallow-polyfield";
    description = "An extension to marshmallow to allow for polymorphic fields";
    license = lib.licenses.asl20;
  };
}
