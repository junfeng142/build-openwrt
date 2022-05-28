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
git clone -b packages https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone -b luci https://github.com/xiaorouji/openwrt-passwall.git package/passwall/luci

# clone own
git clone https://github.com/junfeng142/packages.git package/own 

# clone luci-app-amlogic
git clone https://github.com/ophub/luci-app-amlogic.git package/own/luci-app-amlogic

# display cpu temp
#sed -i 's/thermal\/thermal_zone0\/temp/hwmon\/hwmon0\/temp1_input/g'  package/my/luci2-base/files/luci
