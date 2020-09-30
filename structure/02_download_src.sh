#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/structure/config

function fetch_src() {
    mkdir -v $KFS/sources
	chmod -v a+wt $KFS/sources
	cp $CWD/structure/wget-list $KFS/sources
	cd $KFS/sources
	#wget http://www.linuxfromscratch.org/lfs/view/stable/wget-list
	wget --input-file=wget-list --continue --directory-prefix=$KFS/sources

}

fetch_src
