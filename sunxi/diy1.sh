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

# add extra packages（lede）
#git clone -b master https://github.com/junfeng142/packages.git package/my

# cup mod
#sed -i 's/CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE/CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND/g' target/linux/sunxi/config-5.4（kernel-5.4）
#sed -i 's/rootwait/rootwait g_ether.dev_addr=f8:dc:7a:5e:32:02 g_ether.host_addr=f8:dc:7a:5e:32:01/g' package/boot/uboot-sunxi/uEnv-default.txt(orangepizero)
sed -i 's/rootwait/rootwait g_ether.dev_addr=fa:de:7c:60:34:04 g_ether.host_addr=fa:de:7c:60:34:03/g' package/boot/uboot-sunxi/uEnv-default.txt(nanopineo2)
# Replace network interface
sed -i '/network/s/^/#/g' package/my/default-settings/files/zzz-default-settings
