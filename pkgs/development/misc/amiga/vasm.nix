{ stdenv, fetchzip }:

stdenv.mkDerivation {
  pname = "vasm";
  version = "1.7";

  src = fetchzip {
    url = "http://phoenix.owl.de/tags/vasm1_7.tar.gz";
    sha256 = "sha256-VRJiwElFunMzzBuZKQtCK2kv+EX97vbcudHRyP4zS24=";
  };

  makeFlags = [ "CPU=m68k" "SYNTAX=mot" ];

  installPhase = ''
    install -D -t $out/bin vasmm68k_mot
  '';
}
