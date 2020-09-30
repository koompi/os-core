#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

# Run as root
CWD=$PWD

source $CWD/enter_chroot/config

chown -R root:root $KFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -R root:root $KFS/lib64 ;;
esac