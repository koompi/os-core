#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

create_part() {
  parted --script /dev/sdb \
    mklabel gpt \
    mkpart primary ext2 1Mib 101Mib \
    mkpart primary ext4 101Mib 5G \
    mkpart prmary ext4 5G 20G

  mkfs -v -t ext2 /dev/sdb1
  mkswap /dev/sdb2
  mkfs -v -t ext4 /dev/sdb3
}

mount_part() {
  mkdir -pv $LFS
  mkdir -pv $LFS/boot
  mount -v -t ext2 /dev/sdb1 $LFS/boot
  mount -v -t ext4 /dev/sdb3 $LFS
  /sbin/swapon -v /dev/sdb2
}

create_part && mount_part

mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var}
case $(uname -m) in
x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

echo 'Default password is 123'
echo -e "123\n123" | passwd lfs

chown -v lfs $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
x86_64) chown -v lfs $LFS/lib64 ;;
esac

chown -v lfs $LFS/sources

cd $CWD
cd ..
sudo chown -Rcc lfs os-kfs
# cp -r os-kfs $LFS/
# sudo chown lfs $LFS/os-kfs
# echo 'Download source from github again'
# su - lfs
