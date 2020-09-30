#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

cd $KFS/sources
tar -xf coreutils-8.32.tar.xz
cd coreutils

./configure --prefix=/usr                     \
            --host=$KFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime


make
make DESTDIR=$KFS install


mv -v $KFS/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} $KFS/bin
mv -v $KFS/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm}        $KFS/bin
mv -v $KFS/usr/bin/{rmdir,stty,sync,true,uname}               $KFS/bin
mv -v $KFS/usr/bin/{head,nice,sleep,touch}                    $KFS/bin
mv -v $KFS/usr/bin/chroot                                     $KFS/usr/sbin
mkdir -pv $KFS/usr/share/man/man8
mv -v $KFS/usr/share/man/man1/chroot.1                        $KFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                                           $KFS/usr/share/man/man8/chroot.8

cd $KFS/sources 
rm -rf coreutils-8.32