#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/temporary_tools/config

cd $KFS/sources
tar -xf gzip-1.10.tar.xz
cd gzip-1.10

./configure --prefix=/usr --host=$KFS_TGT

make
make DESTDIR=$KFS install

mv -v $KFS/usr/bin/gzip $KFS/bin

cd $KFS/sources
rm -rf gzip-1.10
