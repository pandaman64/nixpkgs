{ lib
, isPy3k
, buildPythonPackage
, fetchPypi
, jsonschema
, marshmallow
, marshmallow-polyfield
, networkx
, numpy
, pillow
, ply
, psutil
, requests
, requests_ntlm
, scipy
, sympy
, IBMQuantumExperience
, qiskit-aer
}:

buildPythonPackage rec {
  pname = "qiskit-terra";
  version = "0.7.0";

  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "9cc57da08896627d0f34cf6ae76bd3358a5e6e155f612137ff343dd787134720";
  };

  patches = [
    ./marshmallow-polyfield.patch
  ];

  propagatedBuildInputs = [
    jsonschema
    marshmallow
    marshmallow-polyfield
    networkx
    numpy
    pillow
    ply
    psutil
    requests
    requests_ntlm
    scipy
    sympy
    IBMQuantumExperience
  ];

  doCheck = false;

  meta = {
    description = "Terra provides the foundations for Qiskit. It allows the user to write quantum circuits easily, and takes care of the constraints of real hardware";
    homepage = https://qiskit.org/terra;

    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      pandaman
    ];
  };
}
