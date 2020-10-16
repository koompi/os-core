#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config
export LFS

if [ $(id -u) != 0 ]; then
	echo "$0 script need to run as root!"
	exit 1
fi

umount -v $LFS/dev/pts
umount -v $LFS/dev
umount -v $LFS/run
umount -v $LFS/proc
umount -v $LFS/sys

umount -v $LFS/usr
umount -v $LFS/home
umount -v $LFS


umount -v $LFS

echo -n "Do you want to shutdown now or later? (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    shutdown -r now
else
    echo "Thank for using the script, for question please join. t.me/koompi"
fi
