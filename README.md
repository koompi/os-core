# KOOMPI From Scratch

This is an automate script for building KOOMPI From Scratch.

Before the building process started, you need to install [VirtualBox](https://www.virtualbox.org/). During the process, it will be done using virtual machine.

I will assume you are using KOOMPI OS or Arch Linux.
To install Virtualbox, use the command below:

```
sudo pacman -S virtualbox
```

We recommend our [KOOMPI OS](http://repo.koompi.org/iso/KOOMPI-OS-2020.05.20-x86_64.iso) iso for install inside the Virtualbox. (You can use any kind of Linux distribution as long as it based on Arch Linux)

# How to setup KOOMPI OS on Virtualbox?

You can watch this [tutorial](__) to learn how to setup your own virtual machine and installing KOOMPI OS on Virtualbox.

# How KOOMPI From Scratch Work?

In order to build your own KOOMPI From Scratch, you need to learn alot of things and take too much times, in order to learn to build one of your own. That why we create this project to solve the problem for people who want to build their own Linux Distribution. This project automate the building process by using Bash scripting. The reason why this project recommend to use virtual machine as host because it is dangerous to build it on your real machine and the script also made for run on virtual machine.

## Explanation:

-> 1. We build cross compling toolchain from scratch.
-> 2. After we built it already, we install tools(softwares that requirement to start Linux on your machine)
-> 3. And Lastly, we will build it into ISO so you can install it on your own machine.

You can refer to this link if you would like to learn more about how to build Linux or How Linux works.

> 1. [POSIX.1-2008](https://pubs.opengroup.org/onlinepubs/9699919799/)
> 2. [FHS](http://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)
> 3. [LSB](https://refspecs.linuxfoundation.org/lsb.shtml)
> 4. [Cross Compling Toolchain](https://medium.com/@nonuruzun/what-is-a-toolchain-and-a-cross-compiler-2a27f04aff92)
