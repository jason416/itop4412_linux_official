#!/bin/bash

if [ ! -f arch/arm/boot/uImage ]
then
	echo "!!!Cannot find uImage"
	exit
fi

echo "Writing uImage..."
if [ -z $1 ]
then
	dd iflag=dsync oflag=dsync if=arch/arm/boot/uImage of=/dev/sdb seek=4096
else
	dd iflag=dsync oflag=dsync if=arch/arm/boot/uImage of=$1 seek=4096
fi
echo "Writing dtbs..."
if [ -z $1 ]
then
	dd iflag=dsync oflag=dsync if=arch/arm/boot/dts/exynos4412-itop-elite.dtb of=/dev/sdb seek=2048
else
	dd iflag=dsync oflag=dsync if=arch/arm/boot/dts/exynos4412-itop-elite.dtb of=$1 seek=2048
fi
