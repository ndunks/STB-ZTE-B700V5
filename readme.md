# Oprek STB ZTE B700 B700V5


## Serial Port Config

- 8N1 no hw flow control


## U-Boot info
Press enter while boot to go into U-boot command

https://github.com/Freescale/u-boot-fslc/tree/v2009.08



``` bash
# U-Boot CMD

U-Boot-2009.08-svn1653 (Feb 19 2014 - 14:49:32)

Board: B700V5S1 MT8653 [DDR 512M] [FLASH 256M] [INTL] Ver:0x03
NXP B.V. - MT85XX SoC with ARM1176JZF-S
DRAM:  512 MB
NAND:  Nand ID: c2 da 90 95
256 MiB

# some cmd not visible in help
# help
?       - alias for 'help'
base    - print or set address offset
bdinfo  - print Board Info structure
bootm   - boot application image from memory
bootp   - boot image via network using BOOTP/TFTP protocol
bootsys - bootsys - boot system

chpart  - change active partition
cmp     - memory compare
cp      - memory copy
crc32   - checksum calculation
ext2load- load binary file from a Ext2 filesystem
ext2ls  - list files in a directory (default /)
fatgetlength- Get the file length (absolute path)
fatinfo - print information about filesystem
fatload - load binary file from a dos filesystem
fatloadex- load binary file from a dos filesystem
fatls   - list files in a directory (default /)
go      - start application at address 'addr'
help    - print online help
loop    - infinite loop on address range
matchfile- match a file  in a directory
md      - memory display
md5sum  - md5sum        -  calulate the md5 sum

mm      - memory modify (auto-incrementing address)
mtdparts- define flash/nand partitions
mtest   - simple RAM read/write test
mw      - memory write (fill)

# printenv
bootargs=noinitrd root=/dev/mtdblock7 ro 
bootcmd=bootsys
autostart=yes
verify=no
bootdelay=0
baudrate=115200
loadaddr=0x2000000
stdin=serial
stdout=serial
stderr=serial

Environment size: 170/131068 bytes


# nand info
Device 0: nand0, sector size 128 KiB



```

``` bash

# cat /proc/cmdline
console=ttyMT0 kgdboc=ttyMT0 root=/dev/mtdblock9 rootfstype=jffs2 rw init=/init mem=512M mt85xx_reserve=495M,17M drvmem=14

# cat /proc/cpuinfo 
Processor       : ARMv6-compatible processor rev 7 (v6l)
BogoMIPS        : 804.86
Features        : swp half thumb fastmult vfp edsp java 
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0xb76
CPU revision    : 7

Hardware        : mt85xx
Revision        : 0000
Serial          : 0000000000000000

# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 10000000 00020000 "NAND 256MiB 3,3V 8-bit"
mtd1: 00100000 00020000 "boot"
mtd2: 00100000 00020000 "env"
mtd3: 00500000 00020000 "conf"
mtd4: 00400000 00020000 "logo"
mtd5: 00500000 00020000 "kernel1"
mtd6: 00800000 00020000 "rootfs1"   // jffs2
mtd7: 04100000 00020000 "app1"      // squashfs
mtd8: 00500000 00020000 "kernel2"
mtd9: 00800000 00020000 "rootfs2"   // jffs2
mtd10: 04100000 00020000 "app2"     // squashfs
mtd11: 01400000 00020000 "vas"      // ubi
mtd12: 04500000 00020000 "data"     // ubi

# mount
rootfs on / type rootfs (rw)
/dev/root on / type jffs2 (rw,relatime)
devtmpfs on /dev type devtmpfs (rw,relatime,size=184516k,nr_inodes=46129,mode=755)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
none on /proc/bus/usb type usbfs (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
none on /dev/shm type tmpfs (rw,relatime,size=184576k,nr_inodes=46144)
/dev/nandbm10 on /mnt/app type squashfs (ro,relatime)
tmpfs on /var type tmpfs (rw,relatime,size=40960k,nr_inodes=46144)
ubi0:vas on /mnt/vas type ubifs (rw,sync,relatime)
ubi1:data on /mnt/data type ubifs (rw,sync,relatime)

# ubinfo 
UBI version:                    1
Count of UBI devices:           2
UBI control device major/minor: 10:63
Present UBI devices:            ubi0, ubi1

```
