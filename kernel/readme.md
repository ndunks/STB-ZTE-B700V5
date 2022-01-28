# Kernel Information

``` bash
# uname -a
Linux mtkhost 2.6.35 #1 PREEMPT Mon Jan 19 18:03:26 CST 2015 armv6l GNU/Linux
```


## Extracting Kernel from mtdblock0
``` bash
# Set size and offsets
source ../offset.sh

dd if=../dump/mtdblock0 bs=1 count=$boot_size skip=$boot_offset of=boot.bin

dd if=../dump/mtdblock0 bs=1 count=$kernel1_size skip=$kernel1_offset of=kernel1.bin

dd if=kernel1.bin bs=1 skip=96 of=kernel1.uImage
dd if=kernel1.bin bs=1 skip=160 of=kernel1

dd if=../dump/mtdblock0 bs=1 count=$rootfs1_size skip=$rootfs1_offset of=rootfs1.bin

dd if=../dump/mtdblock0 bs=1 count=$kernel2_size skip=$kernel2_offset of=kernel2.bin

dd if=kernel2.bin bs=1 skip=96 of=kernel2.uImage
dd if=kernel2.bin bs=1 skip=160 of=kernel2

dd if=../dump/mtdblock0 bs=1 count=$rootfs2_size skip=$rootfs2_offset of=rootfs2.bin

```

kernel: ARM OpenFirmware FORTH Dictionary, Text length: -509607936 bytes, Data length: -509607936 bytes, Text Relocation Table length: -369098750 bytes, Data Relocation Table length: 24061976 bytes, Entry Point: 0x00000000, BSS length: 2348816 bytes
