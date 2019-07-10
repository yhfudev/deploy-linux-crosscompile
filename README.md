Cross Compile Linux Kernel
==========================

using config file, docker and docker-compose to compile Linux Kernel automatically.


Configure
---------

build docker image:

    docker-compose build


prepare your target root fs:

    tar -xf armbian-ubuntu-18.04-odroidc1-rootfs-1-nat.tgz
    tar -C armbian-ubuntu-18.04-odroidc1-rootfs/usr/src/ -xf linux-source-5.0.12-odroidc1-20190710.tar.xz
    cp linux-config-5.0.12-odroidc1-2-wificards armbian-ubuntu-18.04-odroidc1-rootfs/usr/src/linux-source-5.0.12-odroidc1/.config
    mv armbian-ubuntu-18.04-odroidc1-rootfs deploy-linux-crosscompile/

    echo "ARCH=arm" >> .env
    echo "DN_ROOTFS=`pwd`/armbian-ubuntu-18.04-odroidc1-rootfs" >> .env
    echo "DN_SOURCE=/usr/src/linux-source-5.0.12-odroidc1/" >> .env
    #echo "DN_SOURCE=/usr/src/linux-source-5.0.12-odroidc1/" > armbian-ubuntu-18.04-odroidc1-rootfs/compile.conf

start

    docker-compose up


Reference
---------

[headers-debian-byteshift.patch](https://raw.githubusercontent.com/armbian/build/next/patch/headers-debian-byteshift.patch)


