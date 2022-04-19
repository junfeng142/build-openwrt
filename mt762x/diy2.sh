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

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# add upx
mv ./upx ./staging_dir/host/bin && chmod +x ./staging_dir/host/bin/upx
# batman-adv
rm feeds/routing/batman-adv/patches/0004-Revert-batman-adv-genetlink-make-policy-common-to-fa.patch
# helloworld
#sed -i '/PACKAGE_libustream/d' feeds/helloworld/luci-app-ssr-plus/Makefile
