#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/temporary_tools/config

cd $KFS/sources
tar -xf binutils-2.35.tar.xz
cd binutils-2.35
mkdir -v build
cd       build

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$KFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd

make
make DESTDIR=$KFS install

cd $KFS/sources
rm -rf binutils-2.35
