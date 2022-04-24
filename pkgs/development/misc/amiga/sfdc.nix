{ stdenv, fetchFromGitHub, perl }:

stdenv.mkDerivation {
  pname = "sfdc";
  version = "1.11";

  src = fetchFromGitHub {
    owner = "bebbo";
    repo = "sfdc";
    rev = "2c0528126db16ed191427b1f25208b7db7ec946f";
    sha256 = "sha256-+0cwxrqb7VRTwG7O0dkG1yJ08DknaIfuHtU0KNIAgLU=";
  };

  buildInputs = [ perl ];
}
