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
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

# add upx
mv ./upx ./staging_dir/host/bin && chmod +x ./staging_dir/host/bin/upx

# fix dhcp/kvr and cgi-io
patch -p1 < package/own/patches/dhcp-kvr.patch
patch -p1 < package/own/patches/cgi-io.patch

# batman-adv
#rm feeds/routing/batman-adv/patches/0004-Revert-batman-adv-genetlink-make-policy-common-to-fa.patch
#rm feeds/routing/batman-adv/patches/0037-batman-adv-allow-netlink-usage-in-unprivileged-conta.patch

# golang
rm -rf ./feeds/packages/lang/golang && cp -r ./package/own/golang ./feeds/packages/lang

# Modify
sed -i 's/\"services\"/\"system\"/g' feeds/luci/applications/luci-app-ttyd/luasrc/controller/ttyd.lua
sed -i 's/\(\"ttyd\"\)/\(\"ttyd\")\, 10/g' feeds/luci/applications/luci-app-ttyd/luasrc/controller/ttyd.lua

# helloworld
#sed -i '/PACKAGE_libustream/d' feeds/helloworld/luci-app-ssr-plus/Makefile
