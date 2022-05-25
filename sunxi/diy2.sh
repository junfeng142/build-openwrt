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
sed -i 's/192.168.1.1/192.168.0.5/g' package/base-files/files/bin/config_generate

# fix bug luci-21.02
#patch -p1 < package/own/patches/rpcd-mod-luci.patch

# fix dhcp/dns
patch -p1 < package/own/patches/dhcp-dns.patch

# add upx
mv ./upx ./staging_dir/host/bin && chmod +x staging_dir/host/bin/upx

# golang
rm -rf ./feeds/packages/lang/golang && cp -r ./package/own/golang ./feeds/packages/lang
