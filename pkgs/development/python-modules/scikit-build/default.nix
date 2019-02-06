{ lib
, fetchPypi
, buildPythonPackage
, wheel
, setuptools
, packaging
}:

buildPythonPackage rec {
  pname = "scikit-build";
  version = "0.8.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "2aa4411a7de928d395eca240a6a794aa05c8d1c42ee53a4ae48fa324693902c2";
  };

  # downloads tests from the internet
  doCheck = false;

  propagatedBuildInputs = [
    wheel
    setuptools
    packaging
  ];
}
