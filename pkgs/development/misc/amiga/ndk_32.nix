{ stdenv, fetchurl, lha, sfdc }:

stdenv.mkDerivation {
  pname = "ndk";
  version = "3.2R4";

  src = fetchurl {
    url = "http://aminet.net/dev/misc/NDK3.2.lha";
    sha256 = "sha256-lsq9StaD3O1jLhR7+G3uD1DcsSVDhiFsJcNikWpkCbs=";
  };

  nativeBuildInputs = [ lha sfdc ];

  unpackPhase = ''
    lha x $src
  '';

  patches = [ ./fix_ndk_32.patch ];
  patchFlags = [ "-p0" ];

  buildPhase = ''
    mv Include_H/inline Include_H/inline_old
    mkdir Include_H/inline
    mv Include_H/inline_old/macros.h Include_H/inline/
    mv Include_H/inline_old/stubs.h Include_H/inline/
    rm -r Include_H/inline_old
    sed -i 's/jsr a6/jsr %%a6/g' Include_H/inline/macros.h
    for sfd in SFD/*
    do
      file=$(basename $sfd)
      name=''${file::-8}
      sfdc --mode=macros --target=m68k-amigaos --output=Include_H/inline/$name.h $sfd
    done
  '';

  installPhase = ''
    mkdir -p $out/include
    cp -r Include_H/. $out/include
  '';
}
