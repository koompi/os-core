#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config
export MAKEFLAGS

function build_tool() {
    bash $CWD/toolchain/1_binutils_pass1 &&
        bash $CWD/toolchain/2_gcc_pass1 &&
        bash $CWD/toolchain/3_linux &&
        bash $CWD/toolchain/4_glibc &&
        bash $CWD/toolchain/5_libstdcpp_pass1 &&
        bash $CWD/toolchain/6_m4 &&
        bash $CWD/toolchain/7_ncurses &&
        bash $CWD/toolchain/8_bash &&
        bash $CWD/toolchain/9_coreutils &&
        bash $CWD/toolchain/10_diffutils &&
        bash $CWD/toolchain/11_file &&
        bash $CWD/toolchain/12_findutils &&
        bash $CWD/toolchain/13_gawk &&
        bash $CWD/toolchain/14_grep &&
        bash $CWD/toolchain/15_gzip &&
        bash $CWD/toolchain/16_make &&
        bash $CWD/toolchain/17_patch &&
        bash $CWD/toolchain/18_sed &&
        bash $CWD/toolchain/19_tar &&
        bash $CWD/toolchain/20_xz &&
        bash $CWD/toolchain/21_binutils_pass2 &&
        bash $CWD/toolchain/22_gcc_pass2
}

build_tool
