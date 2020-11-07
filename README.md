# KOOMPI From Scratch

This is an automate script for building KOOMPI From Scratch. This project will be done using Virtual machine. We will use Qemu but you can use any virtual machine you want(only if you are sure what you are doing). We recommend our [KOOMPI OS](http://repo.koompi.org/iso/KOOMPI-OS-2020.05.20-x86_64.iso) to install as Host on the virtual machine.

## Prerequisite:

> CLONE THE REPOSITORY

```
git clone https://github.com/koompi/os-kfs
```

> INSTALL QEMU/KVM

```
sudo bash install-qemu.sh
```

## How to setup KOOMPI OS on Qemu?

You can refer to this [link](). It is a video guide on how to install KOOMPI OS on Qemu.

# How KOOMPI From Scratch Work?

In order to build your own KOOMPI From Scratch, you need to learn alot of things and take too much times, in order to learn to build one of your own. That why we create this project to solve the problem for people who want to build their own Linux Distribution. This project automate the building process by using Bash scripting. The reason why this project recommend to use virtual machine as host because it is dangerous to build it on your real machine and the script also made for running on virtual machine.

## Explanation:

1. We build cross compling toolchain from scratch.
2. After we built it already, we install tools(softwares that requirement to start Linux on your machine)
3. And Lastly, we will build it into ISO so you can install it on your own machine.

## Terms:

<b>Host</b>: the host signifies the very machine on which you'll be doing the vast majority of the work, including cross compilation and installation of the target image.

<b>Target</b>: the target is the final cross-compiled operating system that you'll be building from source packages. It'll be built using the cross compiler on the host machine.

<b>Cross compiler</b>: you'll be building and using a cross compiler to create the target image on the host machine. A cross compiler is built to run on a host machine, but it's used to compile for a target architecture or microprocessor that isn't compatible with the host machine.

You can refer to this link if you would like to learn more about how to build Linux or How Linux works.

> 1. [POSIX.1-2008](https://pubs.opengroup.org/onlinepubs/9699919799/)
> 2. [FHS](http://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)
> 3. [LSB](https://refspecs.linuxfoundation.org/lsb.shtml)
> 4. [Cross Compling Toolchain](https://medium.com/@nonuruzun/what-is-a-toolchain-and-a-cross-compiler-2a27f04aff92)
