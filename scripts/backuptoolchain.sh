#!/bin/sh

. ./config

CWD=$PWD

cd $KFS
tar cvJpf $CWD/toolchain.tar.xz tools

exit 0
