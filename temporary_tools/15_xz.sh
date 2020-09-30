#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/temporary_tools/config

cd $KFS/sources
tar -xf xz-5.2.5.tar.xz
cd xz-5.2.5

./configure --prefix=/usr                     \
            --host=$KFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.5


make
make DESTDIR=$KFS install


mv -v $KFS/usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat}  $KFS/bin
mv -v $KFS/usr/lib/liblzma.so.*                       $KFS/lib
ln -svf ../../lib/$(readlink $KFS/usr/lib/liblzma.so) $KFS/usr/lib/liblzma.so


cd $KFS/sources
rm -rf xz-5.2.5
