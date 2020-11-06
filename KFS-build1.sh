#!/bin/bash

# Color variables ------------------------------------------------------------------
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
NORMAL=$(tput sgr0)
Green='\033[0;32m' # Green
Blue='\033[0;34m'  # Blue
BOLD="$(echo -e "\e[1m")"
CYAN="$(echo -e "\e[36m")"
WHITE='\033[0;37m' # White
CLEAR=clear
NPROC=nproc
# KFS_DEPS
KFS_DEPS=("bash" "binutils" "bison" "bzip2" "coreutils" "diffutils" "gawk" "gcc" "glibc" "grep" "gzip" "m4" "make" "patch" "perl" "sed" "tar" "texinfo" "xz")
MISSING_DEPS=""

#------------ Current directory
CWD=$PWD

# CORE
ncore=0

checkroot() {
    if (($EUID != 0)); then
        echo "Please run this script as root user"
        exit
    fi
}

printf "${Green}This script created for helping automate building KOOMPI FROM SCRATCH\n\n-----------"
printf "${Normal}Now we are checking your system to meet our requirement in order to start the script\n"

check_dep() {
    MISSING_NUM=0
    FOUND_NUM=0

    sudo pacman -Sy

    for ((i = 0; i < ${#KFS_DEPS[@]}; i++)); do
        NUM=$((i + 1))
        echo -ne "Checking Dependencies:${YELLOW} $(($NUM * 100 / ${#KFS_DEPS[@]}))%${NORMAL}\033[0K\r"
        pacman -Qi --color always "${KFS_DEPS[$i]}" &>/dev/null
        if [ $? -eq 0 ]; then
            ((FOUND_NUM++))
        else
            ((MISSING_NUM++))
            MISSING_DEPS+=" ${KFS_DEPS[$i]}"
        fi
    done

    if [[ $MISSING_NUM -gt 0 ]]; then
        echo -e ""
        echo -e "${RED}[no] Some Problems Found.${NORMAL}\n"
        echo -e "Dependencies Found: \t${GREEN}${FOUND_NUM}${NORMAL}"
        echo -e "Dependencies Missing: \t${RED}${MISSING_NUM}${NORMAL}"
        echo -e "Installing Missing Dependencies:\n"
        sudo pacman -S --noconfirm $MISSING_DEPS
    else
        echo -e ""
        echo -e "${BLUE}[ok] No Problems Found.${NORMAL}\n"
        echo -e "Dependencies Found: \t${GREEN}${FOUND_NUM}${NORMAL}"
        echo -e "Dependencies Missing: \t${RED}${MISSING_NUM}${NORMAL}\n"
    fi
}

function main() {
    bash $CWD/scripts/1_prepare.sh
    # su lfs -s /bin/sh /mnt/lfs/scripts/2_setup_env.sh
    # su lfs -s /bin/sh /mnt/lfs/scripts/3_kfs_build_stage1.sh
    # su root -s /bin/sh scripts/4_setup_chroot.sh

}

question() {
    #----------------- Ask for drive ----------------------------------
    num=0
    echo ">>Inside your machine, this is the list of the hard drive availble for you to use<<"
    IFS=, read -r -a array <<<$(lsblk -dn -o NAME,SIZE,TYPE | tr '\n' ,)
    # IFS=, read -r -a array <<<$(lsblk -dn -o NAME | tr '\n' ,)
    for disk in "${array[@]}"; do
        ((num += 1))
        printf "$num. $disk\n"
    done
    read -p 'Enter the drive you want to your
Example: nvme01 | sda | sdb | vdb
-> ' drive
    echo "DISK=${drive}" | tee -a config
    #------------------------------------------------------------------

    # ---------------- Ask for CPU ------------------------------------
    # while read line; do
    #     [ "$line" ] && [ -z "${line%processor*}" ] && ncore=$((ncore + 1))
    # done </proc/cpuinfo
    # echo "You have $ncore core"
    # read -p 'How many core you want to use for compiling?: ' core
    # echo "MAKEFLAGS='-j${core}'" | tee -a config

    #------------------------------------------------------------------

}

checkroot
$CLEAR
question
check_dep
main
