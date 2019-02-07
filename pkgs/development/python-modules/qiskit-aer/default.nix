{ stdenv
, isPy3k
, buildPythonPackage
, fetchFromGitHub
, cmake
, blas
, liblapack
, scikit-build
, cython
, numpy
}:

buildPythonPackage rec {
  pname = "qiskit-aer";
  version = "0.1.1";

  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "Qiskit";
    repo = "qiskit-aer";
    rev = "21fdd7e7503dc8ac7dfaee24b927f26d1eff42f8";
    sha256 = "1p4w1jg6sl9xvmp98nrn5s6drp1rcl67vzi5xdh639kf498y49nz";
  };

  buildInputs = [
    scikit-build
    cython
    cmake
    blas
    liblapack
  ];

  propagatedBuildInputs = [
    numpy
  ];

  doCheck = false;

  meta = {
    description = "Aer is a high performance simulator for quantum circuits that includes noise models";
    homepage    = https://qiskit.org/aer;
    license     = stdenv.lib.licenses.asl20;
    maintainers = with stdenv.lib.maintainers; [
      pandaman
    ];
  };
}
