#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

# Run as root
CWD=$PWD

source $CWD/config

mkdir -pv $KFS/{dev,proc,sys,run}


mknod -m 600 $KFS/dev/console c 5 1
mknod -m 666 $KFS/dev/null c 1 3

mount -v --bind /dev $KFS/dev

mount -v --bind /dev/pts $KFS/dev/pts
mount -vt proc proc $KFS/proc
mount -vt sysfs sysfs $KFS/sys
mount -vt tmpfs tmpfs $KFS/run


if [ -h $KFS/dev/shm ]; then
  mkdir -pv $KFS/$(readlink $KFS/dev/shm)
fi
