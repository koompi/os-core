pacman
├─bash
│ ├─readline provides readline>=7.0
│ │ ├─glibc
│ │ │ ├─linux-api-headers provides linux-api-headers>=4.10
│ │ │ ├─tzdata
│ │ │ └─filesystem
│ │ │   └─iana-etc
│ │ ├─ncurses
│ │ │ ├─glibc
│ │ │ └─gcc-libs
│ │ │   └─glibc provides glibc>=2.27
│ │ └─ncurses provides libncursesw.so=6-64
│ ├─glibc
│ └─ncurses
├─glibc
├─libarchive
│ ├─acl
│ │ └─attr
│ │   └─glibc
│ ├─acl provides libacl.so=1-64
│ ├─bzip2
│ │ ├─glibc
│ │ └─bash provides sh
│ ├─expat
│ │ └─glibc
│ ├─lz4
│ │ └─glibc
│ ├─openssl
│ │ └─perl
│ │   ├─gdbm provides gdbm>=1.17
│ │   │ ├─glibc
│ │   │ └─bash provides sh
│ │   ├─db
│ │   │ ├─gcc-libs
│ │   │ └─bash provides sh
│ │   ├─glibc
│ │   ├─libxcrypt
│ │   │ └─glibc
│ │   └─libxcrypt provides libcrypt.so=2-64
│ ├─xz
│ │ └─bash provides sh
│ ├─zlib
│ │ └─glibc
│ └─zstd
│   ├─zlib
│   ├─xz
│   └─lz4
├─curl
│ ├─ca-certificates
│ │ └─ca-certificates-mozilla
│ │   └─ca-certificates-utils provides ca-certificates-utils>=20181109-3
│ │     ├─bash
│ │     ├─coreutils
│ │     │ ├─glibc
│ │     │ ├─acl
│ │     │ ├─attr
│ │     │ ├─gmp
│ │     │ │ ├─gcc-libs
│ │     │ │ └─bash provides sh
│ │     │ ├─libcap
│ │     │ │ ├─glibc
│ │     │ │ └─pam
│ │     │ │   ├─glibc
│ │     │ │   ├─libtirpc
│ │     │ │   │ └─krb5
│ │     │ │   │   ├─e2fsprogs
│ │     │ │   │   │ ├─bash provides sh
│ │     │ │   │   │ └─util-linux-libs
│ │     │ │   │   ├─libldap
│ │     │ │   │   │ ├─libsasl
│ │     │ │   │   │ │ └─openssl
│ │     │ │   │   │ └─e2fsprogs
│ │     │ │   │   └─keyutils
│ │     │ │   │     ├─glibc
│ │     │ │   │     └─bash provides sh
│ │     │ │   ├─pambase
│ │     │ │   └─audit
│ │     │ │     ├─krb5
│ │     │ │     └─libcap-ng
│ │     │ │       └─glibc
│ │     │ └─openssl
│ │     ├─findutils
│ │     │ ├─glibc
│ │     │ └─bash provides sh
│ │     └─p11-kit provides p11-kit>=0.23.19
│ │       ├─libp11-kit provides libp11-kit=0.23.21-1
│ │       │ ├─glibc
│ │       │ ├─libtasn1
│ │       │ │ └─glibc
│ │       │ └─libffi
│ │       │   └─glibc
│ │       ├─coreutils
│ │       ├─libp11-kit provides libp11-kit.so=0-64
│ │       └─systemd-libs provides libsystemd.so=0-64
│ │         ├─glibc
│ │         ├─libcap
│ │         ├─libgcrypt
│ │         │ └─libgpg-error
│ │         │   ├─glibc
│ │         │   └─bash provides sh
│ │         ├─lz4
│ │         ├─xz
│ │         └─zstd
│ ├─krb5
│ ├─libssh2
│ │ ├─openssl
│ │ └─zlib
│ ├─libssh2 provides libssh2.so=1-64
│ ├─openssl
│ ├─zlib
│ ├─libpsl
│ │ ├─libidn2
│ │ │ └─libunistring
│ │ │   └─glibc
│ │ ├─libidn2 provides libidn2.so=0-64
│ │ └─libunistring
│ ├─libpsl provides libpsl.so=5-64
│ ├─libnghttp2
│ │ └─glibc
│ ├─libidn2
│ ├─libidn2 provides libidn2.so=0-64
│ └─zstd
├─gpgme
│ ├─libgpg-error
│ └─gnupg provides gnupg>=2
│   ├─npth
│   ├─libgpg-error
│   ├─libgcrypt
│   ├─libksba
│   │ ├─bash
│   │ ├─libgpg-error
│   │ └─glibc
│   ├─libassuan
│   │ └─libgpg-error
│   ├─pinentry
│   │ ├─ncurses
│   │ ├─libcap
│   │ ├─libassuan
│   │ └─libsecret
│   │   ├─glib2
│   │   │ ├─pcre
│   │   │ │ ├─gcc-libs
│   │   │ │ ├─readline
│   │   │ │ ├─zlib
│   │   │ │ ├─bzip2
│   │   │ │ └─bash
│   │   │ ├─libffi
│   │   │ ├─util-linux-libs
│   │   │ ├─zlib
│   │   │ └─util-linux-libs provides libmount.so=1-64
│   │   └─libgcrypt
│   ├─bzip2
│   ├─readline
│   ├─readline provides libreadline.so=8-64
│   ├─gnutls
│   │ ├─gcc-libs
│   │ ├─libtasn1
│   │ ├─readline
│   │ ├─zlib
│   │ ├─nettle
│   │ │ └─gmp
│   │ ├─p11-kit
│   │ ├─libidn2
│   │ ├─libidn2 provides libidn2.so=0-64
│   │ └─libunistring
│   ├─sqlite
│   │ ├─readline
│   │ └─zlib
│   ├─zlib
│   └─glibc
├─pacman-mirrorlist
└─archlinux-keyring
