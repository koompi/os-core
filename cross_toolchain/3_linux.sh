#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/cross_toolchain/config

cd $KFS/sources
tar -xf linux-5.8.3.tar.xz
cd linux-5.8.3

make mrproper

make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $KFS/usr

cd $KFS/sources
rm -rf linux
