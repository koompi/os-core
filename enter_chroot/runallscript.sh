#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/cross_toolchain/config

function enter_chroot() {
    bash $CWD/enter_chroot/1_change_ownership.sh &&
    bash $CWD/enter_chroot/2_create_virtual_kernel_filesystem.sh &&
    bash $CWD/enter_chroot/3_enter_chroot_env.sh &&
    bash $CWD/enter_chroot/4_create_directories.sh &&
    bash $CWD/enter_chroot/5_create_file_and_symlinks.sh
}

enter_chroot
