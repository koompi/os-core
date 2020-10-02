#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

## Run the script inside Structure folder from 05 - _

CWD=$PWD
#source $CWD/structure/config

function setup_env() {
    bash $CWD/structure/05_setup_env.sh
}

setup_env