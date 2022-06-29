#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# clone passwall
#git clone -b packages https://github.com/xiaorouji/openwrt-passwall.git package/passwall
#git clone -b luci https://github.com/xiaorouji/openwrt-passwall.git package/passwall/luci

# clone own
git clone https://github.com/junfeng142/packages.git package/own 

# helloworld
git clone https://github.com/fw876/helloworld.git package/helloworld

# clone bypass
git clone https://github.com/kiddin9/openwrt-bypass.git package/bypass

# add wifi/cputemp/usb/uart
patch -p1 < package/own/patches/add-patch_dts_file-wifi-xradio.patch
patch -p1 < package/own/patches/add-patch_sun8i-h3-ths.patch
patch -p1 < package/own/patches/add-patch_sun8i-spi0flash_16M-usb2-usb3-uart1-uart2.patch
patch -p1 < package/own/patches/mac80211.patch

# cup mod
#sed -i 's/CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE/CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND/g' target/linux/sunxi/config-5.4

#add usb_gadget
#cat package/own/configs/sunxi-config >> target/linux/sunxi/config-5.4

# usbphy mac
sed -i 's/rootwait/rootwait g_ether.dev_addr=f8:dc:7a:5e:32:02 g_ether.host_addr=f8:dc:7a:5e:32:01/g' package/boot/uboot-sunxi/uEnv-default.txt
#sed -i 's/rootwait/rootwait g_ether.dev_addr=f8:dc:7a:60:34:04 g_ether.host_addr=f8:dc:7a:60:34:03/g' package/boot/uboot-sunxi/uEnv-default.txt

# Replace network interface
#sed -i '/network/s/^/#/g' package/my/default-settings/files/zzz-default-settings
