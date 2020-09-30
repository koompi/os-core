#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

cd $KFS/sources
tar -xf sed-4.8.tar.xz
cd sed-4.8

./configure --prefix=/usr   \
            --host=$KFS_TGT \
            --bindir=/bin


make
make DESTDIR=$KFS install

cd $KFS/sources
rm -rf sed-4.8