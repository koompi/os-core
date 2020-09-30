#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/structure/config


mkdir -pv $KFS/{bin,etc,lib,sbin,usr,var}
case $(uname -m) in
  x86_64) mkdir -pv $KFS/lib64 ;;
esac

mkdir -pv $KFS/tools
