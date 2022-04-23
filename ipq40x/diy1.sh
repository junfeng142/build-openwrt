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

# clone theme
git clone https://github.com/lynxnexy/luci-theme-tano.git package/luci-theme-tano

# Uncomment a feed source
#sed -i '/network/s/^/#/g' package/my/default-settings/files/zzz-default-settings

# kernel patch
#patch -p1 < ipq40x.patch
