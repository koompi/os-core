#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

cd $KFS/sources
tar -xf grep-3.4.tar.xz
cd grep-3.4

./configure --prefix=/usr   \
            --host=$KFS_TGT \
            --bindir=/bin

make
make DESTDIR=$KFS install

cd $KFS/sources
rm -rf grep-3.4.tar.xz