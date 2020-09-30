#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config


groupadd kfs
/sbin/useradd -s /bin/bash -g kfs -m -k /dev/null kfs

passwd kfs

chown -v kfs $KFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v kfs $KFS/lib64 ;;
esac

chown -v kfs $KFS/sources

echo 'Download script again this time as KFS user'

su - kfs

