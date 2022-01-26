#!/bin/bash

mount | grep $PWD | cut -d ' ' -f3 | xargs sudo umount
sudo rmmod mtdblock
sudo rmmod block2mtd
sudo losetup -d /dev/loop0