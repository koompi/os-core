#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/cross_toolchain/config

cd $KFS/sources
tar -xf gcc-10.2.0.tar.xz
cd gcc-10.2.0

mkdir -v build
cd       build

../libstdc++-v3/configure           \
    --host=$KFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$KFS_TGT/include/c++/10.2.0

make
make DESTDIR=$KFS install

cd $KFS/sources
rm -rf gcc-10.2.0
