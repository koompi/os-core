#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/temporary_tools/config

cd $KFS/sources
tar -xf make-4.3.tar.gz
cd make-4.3

./configure --prefix=/usr   \
            --without-guile \
            --host=$KFS_TGT \
            --build=$(build-aux/config.guess)

make
make DESTDIR=$KFS install


cd $KFS/sources
rm -rf make-4.3
