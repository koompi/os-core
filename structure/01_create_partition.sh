#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >


CWD=$PWD
source $CWD/structure/config

Green='\033[0;32m'  # Green

echo -e "${Green}Enter your disk name, Ex: sda, nvme0n1 by type cmd lsblk"
read disk


Disk=/dev/$disk


function create_part() {
    sudo parted --script $Disk \
	mklabel gpt \
	mkpart primary ext2 1Mib 101Mib \
	mkpart primary ext4 101Mib 5G \
	mkpart prmary ext4 5G 20G

}

function format_part() {
    mkfs -v -t ext2 $Disk\1
	mkswap $Disk\2
	mkfs -v -t ext4 $Disk\3
}

function mount() {
    mkdir -pv $KFS
    mount /dev/sdb3 $KFS
    /sbin/swapon -v $Disk\2 
}



function main() {
	create_part &&
	format_part &&
	mount
}

main