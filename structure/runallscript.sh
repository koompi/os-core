#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/structure/config

function build_structure() {
    bash $CWD/structure/01_create_partition.sh &&
    bash $CWD/structure/02_download_src.sh &&
    bash $CWD/structure/03_create_layout.sh &&
    bash $CWD/structure/04_create_kfs_user.sh

}

build_structure
