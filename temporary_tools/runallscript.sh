#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/temporary_tools/config

function build_temporary_tools() {
    bash $CWD/temporary_tools/1_m4.sh &&
    bash $CWD/temporary_tools/2_ncurses.sh &&
    bash $CWD/temporary_tools/3_bash.sh &&
    bash $CWD/temporary_tools/4_coreutils.sh &&
    bash $CWD/temporary_tools/5_diffutils.sh &&
    bash $CWD/temporary_tools/6_file.sh &&
    bash $CWD/temporary_tools/7_findutils.sh &&
    bash $CWD/temporary_tools/8_gawk.sh &&
    bash $CWD/temporary_tools/9_grep.sh &&
    bash $CWD/temporary_tools/10_gzip.sh &&
    bash $CWD/temporary_tools/11_make.sh &&
    bash $CWD/temporary_tools/12_patch.sh &&
    bash $CWD/temporary_tools/13_sed.sh &&
    bash $CWD/temporary_tools/14_tar.sh &&
    bash $CWD/temporary_tools/15_xz.sh &&
    bash $CWD/temporary_tools/16_binutils.sh &&
    bash $CWD/temporary_tools/17_gcc.sh

}

build_temporary_tools
