#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/cross_toolchain/config

cd $KFS/sources
tar -xf binutils-2.35.tar.xz
cd binutils-2.35

mkdir -v build
cd       build

../configure --prefix=$KFS/tools       \
             --with-sysroot=$KFS        \
             --target=$KFS_TGT          \
             --disable-nls              \
             --disable-werror


make
make install

cd $KFS/sources
rm -rf binutils-2.35
