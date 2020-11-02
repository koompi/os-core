#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config


additional_tools() {
    bash $CWD/additional_tools/1_bison &&
    bash $CWD/additional_tools/2_gcc_libstdcpp &&
    bash $CWD/additional_tools/3_gettext &&
    bash $CWD/additional_tools/4_perl &&
    bash $CWD/additional_tools/5_Python &&
    bash $CWD/additional_tools/6_texinfo &&
    bash $CWD/additional_tools/7_util-linux
}

basic_system_software() {
    bash $CWD/basic_system_software/1_man_pages &&
    bash $CWD/basic_system_software/2_tcl &&
    bash $CWD/basic_system_software/3_expect &&
    bash $CWD/basic_system_software/4_dejagnu &&
    bash $CWD/basic_system_software/5_iana_etc &&
    bash $CWD/basic_system_software/6_glibc &&
    bash $CWD/basic_system_software/7_zlib &&
    bash $CWD/basic_system_software/8_bzip2 &&
    bash $CWD/basic_system_software/9_xz &&
    bash $CWD/basic_system_software/10_zstd &&
    bash $CWD/basic_system_software/11_file &&
    bash $CWD/basic_system_software/12_readline &&
    bash $CWD/basic_system_software/13_m4 &&
    bash $CWD/basic_system_software/14_bc &&
    bash $CWD/basic_system_software/15_flex &&
    bash $CWD/basic_system_software/16_binutils &&
    bash $CWD/basic_system_software/17_gmp &&
    bash $CWD/basic_system_software/18_mpfr &&
    bash $CWD/basic_system_software/19_mpc &&
    bash $CWD/basic_system_software/20_attr &&
    bash $CWD/basic_system_software/21_acl &&
    bash $CWD/basic_system_software/22_libcap &&
    bash $CWD/basic_system_software/23_shadow &&
    bash $CWD/basic_system_software/24_gcc &&
    bash $CWD/basic_system_software/25_pkg_config &&
    bash $CWD/basic_system_software/26_ncurses &&
    bash $CWD/basic_system_software/27_sed &&
    bash $CWD/basic_system_software/28_psmisc &&
    bash $CWD/basic_system_software/29_gettext &&
    bash $CWD/basic_system_software/30_bison &&
    bash $CWD/basic_system_software/31_grep &&
    bash $CWD/basic_system_software/32_bash 
    # bash $CWD/basic_system_software/33_libtool &&
    # bash $CWD/basic_system_software/34_gdbm &&
    # bash $CWD/basic_system_software/35_gperf &&
    # bash $CWD/basic_system_software/36_expat &&
    # bash $CWD/basic_system_software/37_inetutils &&
    # bash $CWD/basic_system_software/38_perl &&
    # bash $CWD/basic_system_software/39_xml_parser &&
    # bash $CWD/basic_system_software/40_intltool &&
    # bash $CWD/basic_system_software/41_autoconf &&
    # bash $CWD/basic_system_software/42_automake &&
    # bash $CWD/basic_system_software/43_kmod &&
    # bash $CWD/basic_system_software/44_libutils &&
    # bash $CWD/basic_system_software/45_libffi &&
    # bash $CWD/basic_system_software/46_openssl &&
    # bash $CWD/basic_system_software/47_Python &&
    # bash $CWD/basic_system_software/48_ninja &&
    # bash $CWD/basic_system_software/49_meson &&
    # bash $CWD/basic_system_software/50_coreutils &&
    # bash $CWD/basic_system_software/51_check &&
    # bash $CWD/basic_system_software/52_diffutils &&
    # bash $CWD/basic_system_software/53_gawk &&
    # bash $CWD/basic_system_software/54_findutils &&
    # bash $CWD/basic_system_software/55_groff &&
    # bash $CWD/basic_system_software/56_grub &&
    # bash $CWD/basic_system_software/57_less &&
    # bash $CWD/basic_system_software/58_gzip &&
    # bash $CWD/basic_system_software/59_iproute &&
    # bash $CWD/basic_system_software/60_kbd &&
    # bash $CWD/basic_system_software/61_libpipeline &&
    # bash $CWD/basic_system_software/62_make &&
    # bash $CWD/basic_system_software/63_patch &&
    # bash $CWD/basic_system_software/64_man-db &&
    # bash $CWD/basic_system_software/65_tar &&
    # bash $CWD/basic_system_software/66_texinfo &&
    # bash $CWD/basic_system_software/67_vim &&
    # bash $CWD/basic_system_software/68_eudev &&
    # bash $CWD/basic_system_software/69_procps_ng &&
    # bash $CWD/basic_system_software/70_utils_linux &&
    # bash $CWD/basic_system_software/71_e2fsprogs &&
    # bash $CWD/basic_system_software/72_sysklogd &&
    # bash $CWD/basic_system_software/73_sysvinit 
    # bash $CWD/basic_system_software/ &&
    # bash $CWD/basic_system_software/ &&
    
}

strip_lib() {
save_lib="ld-2.32.so libc-2.32.so libpthread-2.32.so libthread_db-1.0.so"

cd /lib

for LIB in $save_lib; do
    objcopy --only-keep-debug $LIB $LIB.dbg 
    strip --strip-unneeded $LIB
    objcopy --add-gnu-debuglink=$LIB.dbg $LIB 
done    

save_usrlib="libquadmath.so.0.0.0 libstdc++.so.6.0.28
             libitm.so.1.0.0 libatomic.so.1.2.0" 

cd /usr/lib

for LIB in $save_usrlib; do
    objcopy --only-keep-debug $LIB $LIB.dbg
    strip --strip-unneeded $LIB
    objcopy --add-gnu-debuglink=$LIB.dbg $LIB
done

unset LIB save_lib save_usrlib


find /usr/lib -type f -name \*.a \
   -exec strip --strip-debug {} ';'

find /lib /usr/lib -type f -name \*.so* ! -name \*dbg \
   -exec strip --strip-unneeded {} ';'

find /{bin,sbin} /usr/{bin,sbin,libexec} -type f \
    -exec strip --strip-all {} ';'

}
additional_tools
basic_system_software
echo -e "Run the pass2 script"
#strip_lib;
# rm -rf /tmp/*
# logout
