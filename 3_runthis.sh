#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

## Run the script inside Structure folder from 05 - _

CWD=$PWD
#source $CWD/structure/config

# function setup_env() {
#     bash $CWD/structure/05_setup_env.sh
# }

function build_cross_toolchain() {
    bash $CWD/cross_toolchain/runallscript.sh

}

function build_temporary_tools() {
    bash $CWD/temporary_tools/runallscript.sh
}

function main() {
    #setup_env &&
    build_cross_toolchain &&
    build_temporary_tools  
}

main
