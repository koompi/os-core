#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/toolchain/config

function build_cross_toolchain() {
    bash $CWD/toolchain/1_binutils.sh &&
    bash $CWD/toolchain/2_gcc.sh &&
    bash $CWD/toolchain/3_linux.sh && 
    bash $CWD/toolchain/4_glibc.sh &&
    bash $CWD/toolchain/5_libstdc++.sh
}

build_cross_toolchain
