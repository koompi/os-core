#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/temporary_tools/config

cd $KFS/sources
tar -xf bash-5.0.tar.gz
cd bash-5.0

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$KFS_TGT                 \
            --without-bash-malloc

make
make DESTDIR=$KFS install
mv $KFS/usr/bin/bash $KFS/bin/bash

ln -sv bash $KFS/bin/sh

cd $KFS/sources
rm -rf bash-5.0
