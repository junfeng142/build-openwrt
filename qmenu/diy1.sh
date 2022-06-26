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

# clone helloworld
git clone https://github.com/fw876/helloworld.git package/helloworld

# clone bypass
git clone https://github.com/kiddin9/openwrt-bypass.git package/bypass

# clone own
git clone https://github.com/junfeng142/packages.git package/own

# Uncomment password
sed -i '/shadow/s/^/#/g' package/lean/default-settings/files/zzz-default-settings

# clone luci-app-amlogic
#git clone https://github.com/ophub/luci-app-amlogic.git package/own/luci-app-amlogic

# clone N1HK1dabao
git clone https://github.com/Netflixxp/N1HK1dabao.git N1HK1dabao

# display cpu temp
#sed -i 's/thermal\/thermal_zone0\/temp/hwmon\/hwmon0\/temp1_input/g'  package/my/luci2-base/files/luci
