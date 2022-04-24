{ stdenv, fetchzip }:

stdenv.mkDerivation {
  pname = "vlink";
  version = "0.17";

  src = fetchzip {
    url = "http://phoenix.owl.de/tags/vlink0_17.tar.gz";
    sha256 = "sha256-pi1tdb3mwjhhu9iArvAIWp6uouRFzgDvGto2rVl+/ng=";
  };

  installPhase = ''
    install -D -t $out/bin vlink
  '';
}
