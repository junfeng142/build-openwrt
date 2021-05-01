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

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#add extra packages
git clone https://github.com/junfeng142/openwrt-packages package/my
#add kernel patches
rm -rf target/linux/sunxi/patches-5.4
git clone git@github.com:junfeng142/patches-5.4.git target/linux/sunxi/patches-5.4
# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
