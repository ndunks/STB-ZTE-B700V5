#!/bin/bash
# nodemon -I -w qemulate.sh --delay 0.3 -x "./qemulate.sh || false"
# Not working
qemu-system-arm -m 256M -M versatilepb -cpu arm1176 \
    -kernel qemu/u-boot-nodtb.bin \
    -nographic
# -serial stdio
    
# qemu-system-arm -m 256M -M virt -nographic \
#     -bios qemu/u-boot-nodtb.bin \
#     -kernel kernel/kernel1 \
#     -device nand,chip_id=0x59,id=nand0 \
#     -drive if=mtd,format=raw,file=dump/mtdblock0,id=nand0 \
#     -append "console=ttyS0 rw init=/init root=/dev/sda rootfstype=jffs2 rw"
