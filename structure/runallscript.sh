#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD

function build_structure() {
    bash $CWD/01_create_partition.sh &&
    bash $CWD/02_download_src.sh &&
    bash $CWD/03_create_layout.sh &&
    bash $CWD/04_create_kfs_user.sh

}

build_structure