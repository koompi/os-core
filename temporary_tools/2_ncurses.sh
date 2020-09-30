#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

cd $KFS/sources
tar -xf ncurses-6.2.tar.gz
cd ncurses-6.2

sed -i s/mawk// configure

mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd


./configure --prefix=/usr                \
            --host=$KFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-debug              \
            --without-ada                \
            --without-normal             \
            --enable-widec


make

make DESTDIR=$KFS TIC_PATH=$(pwd)/build/progs/tic install
echo "INPUT(-lncursesw)" > $KFS/usr/lib/libncurses.so

mv -v $KFS/usr/lib/libncursesw.so.6* $KFS/lib
ln -sfv ../../lib/$(readlink $KFS/usr/lib/libncursesw.so) $KFS/usr/lib/libncursesw.so

cd $KFS/sources
rm -rf ncurses-6.2
