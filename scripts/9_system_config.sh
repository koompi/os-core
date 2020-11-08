#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config

rm -f /usr/lib/lib{bfd,opcodes}.a
rm -f /usr/lib/libctf{,-nobfd}.a
rm -f /usr/lib/libbz2.a
rm -f /usr/lib/lib{com_err,e2p,ext2fs,ss}.a
rm -f /usr/lib/libltdl.a
rm -f /usr/lib/libfl.a
rm -f /usr/lib/libz.a

find /usr/lib /usr/libexec -name \*.la -delete
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf
rm -rf /tools
userdel -r tester

bash $CWD/basic_system_software/74_lfs_bootscripts

bash /lib/udev/init-net-rules.sh
cat /etc/udev/rules.d/70-persistent-net.rules

udevadm info -a -p /sys/class/video4linux/video0

cat > /etc/udev/rules.d/83-duplicate_devs.rules <<"EOF"

# Persistent symlinks for webcam and tuner
KERNEL=="video*", ATTRS{idProduct}=="1910", ATTRS{idVendor}=="0d81", SYMLINK+="webcam"
KERNEL=="video*", ATTRS{device}=="0x036f",  ATTRS{vendor}=="0x109e", SYMLINK+="tvtuner"

EOF

# Creating Network Interface Configuration Files
cd /etc/sysconfig/
cat > ifconfig.eth0 <<"EOF"
ONBOOT=yes
IFACE=eth0
SERVICE=ipv4-static
IP=192.168.1.2
GATEWAY=192.168.1.1
PREFIX=24
BROADCAST=192.168.1.255
EOF

# nameserver 192.168.1.1
# nameserver 180.178.124.12
# nameserver 96.9.64.12

# Creating the /etc/resolv.conf File
cat > /etc/resolv.conf <<"EOF"
# Begin /etc/resolv.conf

nameserver 180.178.124.12
nameserver 96.9.64.12

# End /etc/resolv.conf
EOF

# Configuring the system hostname
echo "KOOMPI" > /etc/hostname

# Customizing the /etc/hosts File
cat > /etc/hosts <<"EOF"
# Begin /etc/hosts

127.0.0.1 localhost.localdomain localhost
127.0.1.1 koompi
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF

# Configuring Sysvinit
cat > /etc/inittab <<"EOF"
# Begin /etc/inittab

id:3:initdefault:

si::sysinit:/etc/rc.d/init.d/rc S

l0:0:wait:/etc/rc.d/init.d/rc 0
l1:S1:wait:/etc/rc.d/init.d/rc 1
l2:2:wait:/etc/rc.d/init.d/rc 2
l3:3:wait:/etc/rc.d/init.d/rc 3
l4:4:wait:/etc/rc.d/init.d/rc 4
l5:5:wait:/etc/rc.d/init.d/rc 5
l6:6:wait:/etc/rc.d/init.d/rc 6

ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now

su:S016:once:/sbin/sulogin

1:2345:respawn:/sbin/agetty --noclear tty1 9600
2:2345:respawn:/sbin/agetty tty2 9600
3:2345:respawn:/sbin/agetty tty3 9600
4:2345:respawn:/sbin/agetty tty4 9600
5:2345:respawn:/sbin/agetty tty5 9600
6:2345:respawn:/sbin/agetty tty6 9600

# End /etc/inittab
EOF

# Configuring the System Clock
cat > /etc/sysconfig/clock <<"EOF"
# Begin /etc/sysconfig/clock

UTC=1

# Set this to any options you might need to give to hwclock,
# such as machine hardware clock type for Alphas.
CLOCKPARAMS=

# End /etc/sysconfig/clock
EOF

# Configuring the Linux Console
cat > /etc/sysconfig/console <<"EOF"
# Begin /etc/sysconfig/console

UNICODE="1"
KEYMAP="bg_bds-utf8"
FONT="cyr-sun16"

# End /etc/sysconfig/console
EOF

# cat > /etc/sysconfig/console << "EOF"
# # Begin /etc/sysconfig/console

# UNICODE="1"
# KEYMAP="bg_bds-utf8"
# FONT="LatArCyrHeb-16"

# # End /etc/sysconfig/console
# EOF

# Configuring the sysklogd Script
SYSKLOGD_PARMS=

# Config Bash Shell Startup File
# locale -a
LC_ALL=en_GB.iso88591 locale charmap

cat > /etc/profile <<"EOF"
# Begin /etc/profile

export LANG=en_GB.ISO-8859-1

# End /etc/profile
EOF

# Creating the /etc/inputrc File
cat > /etc/inputrc <<"EOF"
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>

# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF

# Creating the /etc/shells File
cat > /etc/shells <<"EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF

# Creating the /etc/fstab File
cat > /etc/fstab <<"EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

/dev/vdb3     /            ext4    defaults            1     1
/dev/vdb2     swap         swap     pri=1               0     0
proc           /proc        proc     nosuid,noexec,nodev 0     0
sysfs          /sys         sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts     devpts   gid=5,mode=620      0     0
tmpfs          /run         tmpfs    defaults            0     0
devtmpfs       /dev         devtmpfs mode=0755,nosuid    0     0

# End /etc/fstab
EOF

build_kernel() {
    bash $CWD/basic_system_software/75_linux
    bash $CWD/basic_system_software/76_libburn
    bash $CWD/basic_system_software/77_libisofs
    bash $CWD/basic_system_software/78_libisoburn

}

build_kernel

cd /tmp 
grub-mkrescue --output=grub-img.iso 
xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso


# install grub
grub-install /dev/vdb

# Creating the grub confi file
cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod ext2
set root=(hd0,2)

menuentry "GNU/Linux, Linux 5.8.3-lfs-10.0" {
        linux   /boot/vmlinuz-5.8.3-lfs-10.0 root=/dev/vdb3 ro
}
EOF

echo 10.0 > /etc/lfs-release

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="10.0"
DISTRIB_CODENAME="Hangsia HONG"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="10.0"
ID=lfs
PRETTY_NAME="Linux From Scratch 10.0"
VERSION_CODENAME="Hangsia HONG"
EOF




echo -e "Run the Last Script for umount virtual file systems"
# logout
