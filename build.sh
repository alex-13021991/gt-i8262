#!/bin/sh

rm -rf ~/gt-i8262/build/gt-i8262-bin
cd kernel
. ~/gt-i8262/build.env
mkdir -p ~/gt-i8262/build/gt-i8262
make O=~/gt-i8262/build/gt-i8262 mrproper
make O=~/gt-i8262/build/gt-i8262 arubaslim_europen_user_defconfig
make -j5 O=~/gt-i8262/build/gt-i8262
mkdir -p ~/gt-i8262/build/gt-i8262-bin
mkdir -p ~/gt-i8262/build/gt-i8262-bin/modules
cp ~/gt-i8262/build/gt-i8262/arch/arm/boot/zImage ~/gt-i8262/build/gt-i8262-bin/
find ~/gt-i8262/build/gt-i8262/ -type f -name *.ko -exec cp {} ~/gt-i8262/build/gt-i8262-bin/modules/ \;
rm -rf ~/gt-i8262/build/gt-i8262
cd ~/gt-i8262/
