#!/bin/bash


# the linux source directory
# related to the /target_root
if [ -f "/target_root/compile.conf" ]; then
. /target_root/compile.conf
fi
DN_SOURCE="${DN_SOURCE:-/usr/src/linux-source-5.0.12-odroidc1/}"

ARCH="${ARCH:-arm}"

case "$1" in
    -- | compile)

        cd /target_root
        DN_ROOTFS=$(pwd)
        cp /usr/bin/qemu-${ARCH}-static "${DN_ROOTFS}/usr/bin/"
        cp /run.sh /target_root

        chroot ${DN_ROOTFS} /run.sh "${DN_SOURCE}"
        ;;
    *)
        exec "$@"
esac


exit 1

