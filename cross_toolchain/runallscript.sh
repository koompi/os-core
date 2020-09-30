#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

function build_cross_toolchain() {
    bash $CWD/1_binutils.sh &&
    bash $CWD/2_gcc.sh &&
    bash $CWD/3_linux.sh && 
    bash $CWD/4_glibc.sh &&
    bash $CWD/5_libstdc++.sh
}

build_cross_toolchain