#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/temporary_tools/config

cd $KFS/sources
tar -xf file-5.39.tar.gz
cd file-5.39

./configure --prefix=/usr --host=$KFS_TGT


make
make DESTDIR=$KFS install

cd $KFS/sources
rm -rf file-5.39
