#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

cd $KFS/sources
tar -xf diffutils-3.7.tar.xz
cd diffutils-3.7

./configure --prefix=/usr --host=$KFS_TGT

make
make DESTDIR=$KFS install

cd $KFS/sourcess
rm -rf diffutils-3.7
