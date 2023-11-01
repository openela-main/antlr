#!/bin/bash
set -e

name=antlr
version="$(sed -n 's/Version:\s*//p' *.spec)"

# RETRIEVE
wget "http://www.antlr2.org/download/antlr-${version}.tar.gz" -O "${name}-${version}.orig.tar.gz"

rm -rf tarball-tmp
mkdir tarball-tmp
cd tarball-tmp
tar xf "../${name}-${version}.orig.tar.gz"

# CLEAN TARBALL
# contain questionable things, such as csflex.exe
find -name '*.jar' -delete
find -name '*.class' -delete
find -name '*.exe' -delete
find -name '*.dll' -delete
find -name '*.so' -delete

tar cf "../${name}-${version}.tar.gz" *
cd ..
rm -r tarball-tmp "${name}-${version}.orig.tar.gz"
