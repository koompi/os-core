#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config


continue_build() {
    bash $CWD/basic_system_software/33_libtool &&
    bash $CWD/basic_system_software/34_gdbm &&
    bash $CWD/basic_system_software/35_gperf &&
    bash $CWD/basic_system_software/36_expat &&
    bash $CWD/basic_system_software/37_inetutils &&
    bash $CWD/basic_system_software/38_perl &&
    bash $CWD/basic_system_software/39_xml_parser &&
    bash $CWD/basic_system_software/40_intltool &&
    bash $CWD/basic_system_software/41_autoconf &&
    bash $CWD/basic_system_software/42_automake &&
    bash $CWD/basic_system_software/43_kmod &&
    bash $CWD/basic_system_software/44_libutils &&
    bash $CWD/basic_system_software/45_libffi &&
    bash $CWD/basic_system_software/46_openssl &&
    bash $CWD/basic_system_software/47_Python &&
    bash $CWD/basic_system_software/48_ninja &&
    bash $CWD/basic_system_software/49_meson &&
    bash $CWD/basic_system_software/50_coreutils &&
    bash $CWD/basic_system_software/51_check &&
    bash $CWD/basic_system_software/52_diffutils &&
    bash $CWD/basic_system_software/53_gawk &&
    bash $CWD/basic_system_software/54_findutils &&
    bash $CWD/basic_system_software/55_groff &&
    bash $CWD/basic_system_software/56_grub &&
    bash $CWD/basic_system_software/57_less &&
    bash $CWD/basic_system_software/58_gzip &&
    bash $CWD/basic_system_software/59_iproute &&
    bash $CWD/basic_system_software/60_kbd &&
    bash $CWD/basic_system_software/61_libpipeline &&
    bash $CWD/basic_system_software/62_make &&
    bash $CWD/basic_system_software/63_patch &&
    bash $CWD/basic_system_software/64_man-db &&
    bash $CWD/basic_system_software/65_tar &&
    bash $CWD/basic_system_software/66_texinfo &&
    bash $CWD/basic_system_software/67_vim &&
    bash $CWD/basic_system_software/68_eudev &&
    bash $CWD/basic_system_software/69_procps_ng &&
    bash $CWD/basic_system_software/70_utils_linux &&
    bash $CWD/basic_system_software/71_e2fsprogs &&
    bash $CWD/basic_system_software/72_sysklogd &&
    bash $CWD/basic_system_software/73_sysvinit 
}

continue_build
rm -rf /tmp/*
logout