#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/temporary_tools/config

cd $KFS/sources
tar -xf gcc-10.2.0.tar.xz
cd gcc-10.2.0

tar -xf ../mpfr-4.1.0.tar.xz
mv -v mpfr-4.1.0 mpfr
tar -xf ../gmp-6.2.0.tar.xz
mv -v gmp-6.2.0 gmp
tar -xf ../mpc-1.1.0.tar.gz
mv -v mpc-1.1.0 mpc


case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir -v build
cd       build

mkdir -pv $KFS_TGT/libgcc
ln -s ../../../libgcc/gthr-posix.h $KFS_TGT/libgcc/gthr-default.h


../configure                                       \
    --build=$(../config.guess)                     \
    --host=$KFS_TGT                                \
    --prefix=/usr                                  \
    CC_FOR_TARGET=$KFS_TGT-gcc                     \
    --with-build-sysroot=$KFS                      \
    --enable-initfini-array                        \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++


make
make DESTDIR=$KFS install


ln -sv gcc $KFS/usr/bin/cc


cd $KFS/sources
rm -rf gcc-10.2.0


# finished here --- Go next after you come back(hangsia)
