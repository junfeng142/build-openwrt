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

# clone ssr
git clone -b ssr https://github.com/junfeng142/packages.git package/ssr

# clone own
git clone https://github.com/junfeng142/packages.git package/own

# fit mac80211
#patch -p1 < $GITHUB_WORKSPACE/ar7xx/ar7xx.patch

# Modify image size
sed -i 's/tplink-8mlzma/tplink-16mlzma/g' target/linux/ar71xx/image/tiny-tp-link.mk

