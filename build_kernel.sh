#cp config_for_iTop-4412_scp .config
export ARCH=arm

if [ ! -e .config ]; then
    #make iTop-4412_scp_defconfig
	echo "--->using itop4412_defconfig_nfs!"
	cp itop4412_defconfig_nfs .config
fi

make uImage LOADADDR=0x40007000 -j8

make dtbs

# 1. if you DO NEED install modules, uncomment these lines
# 2. INSTALL_MOD_PATH -> your rootfs path
# make modules
# make modules_install INSTALL_MOD_PATH=/home/jason/rootfs/

KERNEL=arch/arm/boot/uImage
DTB=arch/arm/boot/dts/exynos4412-itop-elite.dtb

if [ -e $KERNEL ]; then
    rm -rf ~/Desktop/uImage
    cp $KERNEL ~/Desktop/
fi

if [ -e $DTB ]; then
    rm -rf ~/Desktop/exynos4412-itop-elite.dtb
    cp $DTB ~/Desktop/
fi
