# Kernel Information

``` bash
# uname -a
Linux mtkhost 2.6.35 #1 PREEMPT Mon Jan 19 18:03:26 CST 2015 armv6l GNU/Linux
```


## Extracting Kernel from mtdblock0
``` bash
OFFSET=0
# boot
OFFSET=$(( $OFFSET + 0x00100000 ))
# env
OFFSET=$(( $OFFSET + 0x00100000 ))
# conf
OFFSET=$(( $OFFSET + 0x00500000 ))
# logo
OFFSET=$(( $OFFSET + 0x00400000 ))
# kernel1 OFFSET 11534336
KERNEL1_OFFSET=$OFFSET
OFFSET=$(( $OFFSET + 0x00500000 ))
# rootfs1 OFFSET 16777216
ROOTFS1_OFFSET=$OFFSET

dd if=../dump/mtdblock0 bs=1 count=$(( 0x00500000 )) skip=11534336 of=kernel1.bin

dd if=kernel1.bin bs=1 skip=160 of=kernel

dd if=../dump/mtdblock0 bs=1 count=$(( 0x00800000 )) skip=16777216 of=rootfs1.bin
# JFFS2
```

kernel: ARM OpenFirmware FORTH Dictionary, Text length: -509607936 bytes, Data length: -509607936 bytes, Text Relocation Table length: -369098750 bytes, Data Relocation Table length: 24061976 bytes, Entry Point: 0x00000000, BSS length: 2348816 bytes
