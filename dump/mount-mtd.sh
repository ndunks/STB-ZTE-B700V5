#!/bin/bash
set -e
[ "$UID" = "0" ] || exec sudo /bin/bash "$0" "$@"

## Method 1
# modprobe mtdram total_size=$(( 1024 * 256 )) erase_size=128
# cp mtdblock0 /dev/mtd0

## Method 2
LOOP_DEVICE=`losetup --show -f mtdblock0`
modprobe mtdblock
modprobe block2mtd block2mtd=$LOOP_DEVICE,128ki
## Add partition
OFFSET=0
mtdpart add /dev/mtd0 boot      $OFFSET 0x00100000
OFFSET=$(( $OFFSET + 0x00100000 ))
mtdpart add /dev/mtd0 env       $OFFSET 0x00100000
OFFSET=$(( $OFFSET + 0x00100000 ))
mtdpart add /dev/mtd0 conf      $OFFSET 0x00500000 
OFFSET=$(( $OFFSET + 0x00500000 ))
mtdpart add /dev/mtd0 logo      $OFFSET 0x00400000 
OFFSET=$(( $OFFSET + 0x00400000 ))
mtdpart add /dev/mtd0 kernel1   $OFFSET 0x00500000 
OFFSET=$(( $OFFSET + 0x00500000 ))
mtdpart add /dev/mtd0 rootfs1   $OFFSET 0x00800000 
OFFSET=$(( $OFFSET + 0x00800000 ))
mtdpart add /dev/mtd0 app1      $OFFSET 0x04100000 
OFFSET=$(( $OFFSET + 0x04100000 ))
mtdpart add /dev/mtd0 kernel2   $OFFSET 0x00500000 
OFFSET=$(( $OFFSET + 0x00500000 ))
mtdpart add /dev/mtd0 rootfs2   $OFFSET 0x00800000 
OFFSET=$(( $OFFSET + 0x00800000 ))
mtdpart add /dev/mtd0 app2      $OFFSET  0x04100000 
OFFSET=$(( $OFFSET + 0x04100000 ))
mtdpart add /dev/mtd0 vas       $OFFSET  0x01400000 
OFFSET=$(( $OFFSET + 0x01400000 ))
mtdpart add /dev/mtd0 data      $OFFSET  0x04500000 
OFFSET=$(( $OFFSET + 0x04500000 ))
echo "Loop device: $LOOP_DEVICE OFFSET END $OFFSET"
cat /proc/mtd
echo "Mounting known partition"
mkdir -p mount/{rootfs1,rootfs2,app1,app2}
mount -t jffs2     /dev/mtdblock6 ./mount/rootfs1/
mount -t jffs2     /dev/mtdblock9 ./mount/rootfs2/

mount -t squashfs /dev/mtdblock7 ./mount/app1/
mount -t squashfs /dev/mtdblock10 ./mount/app2/

## Remove device
# mount | grep $PWD | cut -d ' ' -f3 | xargs sudo umount
# sudo rmmod block2mtd
# sudo losetup -d /dev/loop0