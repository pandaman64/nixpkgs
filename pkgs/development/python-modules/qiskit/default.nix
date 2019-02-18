{ stdenv
, isPy3k
, buildPythonPackage
, fetchPypi
, qiskit-aer
, qiskit-terra
}:

buildPythonPackage rec {
  pname = "qiskit";
  version = "0.7.2";

  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "08c7f7ccd32a5cb0c0a0c4f63d6ff068d659c9c0b51e2df6f2054e586e8bfa19";
  };

  patches = [
    ./no-override.patch
  ];

  propagatedBuildInputs = [
    qiskit-aer
    qiskit-terra
  ];

  meta = {
    description = "Quantum Software Development Kit for writing quantum computing experiments, programs, and applications";
    homepage    = https://github.com/Qiskit/qiskit;
    license     = stdenv.lib.licenses.asl20;
    maintainers = with stdenv.lib.maintainers; [
      pandaman
    ];
  };
}
