#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

### this for enter chroot and build more temporary tools
CWD=$PWD
source $CWD/cross_toolchain/config

function main() {
    bash $CWD/enter_chroot/runallscript.sh

}


main
