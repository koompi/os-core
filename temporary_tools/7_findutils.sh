#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

cd $KFS/sources
tar -xf findutils-4.7.0.tar.xz
cd findutils-4.7.0

./configure --prefix=/usr   \
            --host=$KFS_TGT \
            --build=$(build-aux/config.guess)


make
make DESTDIR=$KFS install

mv -v $KFS/usr/bin/find $KFS/bin
sed -i 's|find:=${BINDIR}|find:=/bin|' $KFS/usr/bin/updatedb


cd $KFS/sources
rm -rf findutils-4.7.0