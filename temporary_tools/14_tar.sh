#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

cd $KFS/sources
tar -xf tar-1.32.tar.xz
cd tar-1.32

./configure --prefix=/usr                     \
            --host=$KFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --bindir=/bin

make
make DESTDIR=$KFS install

cd $KFS/sources
rm -rf tar-1.32