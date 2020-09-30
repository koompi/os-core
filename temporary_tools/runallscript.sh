#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/temporary_tools/config

function build_temporary_tools() {
    bash $CWD/1_m4.sh &&
    bash $CWD/2_ncurses.sh &&
    bash $CWD/3_bash.sh &&
    bash $CWD/4_coreutils.sh &&
    bash $CWD/5_diffutils.sh &&
    bash $CWD/6_file.sh &&
    bash $CWD/7_findutils.sh &&
    bash $CWD/8_gawk.sh &&
    bash $CWD/9_grep.sh &&
    bash $CWD/10_gzip.sh &&
    bash $CWD/11_make.sh &&
    bash $CWD/12_patch.sh &&
    bash $CWD/13_sed.sh &&
    bash $CWD/14_tar.sh &&
    bash $CWD/15_xz.sh &&
    bash $CWD/16_binutils.sh &&
    bash $CWD/17_gcc.sh

}

build_temporary_tools
