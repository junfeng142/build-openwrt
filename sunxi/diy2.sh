#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# add cpu temperature（lede）
#patch -p1 < package/my/add-patch_sun8i-h3-ths.patch
#cup mod（lede）
#sed -i 's/CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE/CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND/g' target/linux/sunxi/config-5.4
#sed -i 's/rootwait/rootwait g_ether.dev_addr=f8:dc:7a:5e:32:02 g_ether.host_addr=f8:dc:7a:5e:32:01/g' package/boot/uboot-sunxi/uEnv-default.txt
#add usb_gadget（lede）
#cat package/my/sunxi-config >> target/linux/sunxi/config-5.4

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate
# add upx
mv ./upx ./staging_dir/host/bin && chmod +x staging_dir/host/bin/upx
# helloworld
#sed -i '/PACKAGE_libustream/d' feeds/helloworld/luci-app-ssr-plus/Makefile
# golang
rm -rf ./feeds/packages/lang/golang && cp -r ./package/my/golang ./feeds/packages/lang