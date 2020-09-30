#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

# Run as root
CWD=$PWD

source $CWD/enter_chroot/config

chroot "$KFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(kfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login +h