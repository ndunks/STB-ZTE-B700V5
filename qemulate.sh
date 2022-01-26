#!/bin/bash
# Not working
qemu-system-arm -m 256M -M versatilepb -cpu arm1026 \
    -kernel kernel \
    -append "console=ttyS0 rw init=/init root=/dev/sda rootfstype=jffs2 rw" \
    -hda rootfs1.bin \
    -nographic

    # -serial stdio
