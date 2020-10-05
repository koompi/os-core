#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/cross_toolchain/config

function build_cross_toolchain() {
    bash $CWD/cross_toolchain/1_binutils.sh &&
    bash $CWD/cross_toolchain/2_gcc.sh &&
    bash $CWD/cross_toolchain/3_linux.sh && 
    bash $CWD/cross_toolchain/4_glibc.sh &&
    bash $CWD/cross_toolchain/5_libstdcpp.sh
}

build_cross_toolchain
