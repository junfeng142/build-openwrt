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
sed -i 's/192.168.1.1/192.168.1.8/g' package/base-files/files/bin/config_generate

# fix bug luci-21.02
#patch -p1 < package/own/patches/rpcd-mod-luci.patch

# fix dhcp/kvr and cgi-io
patch -p1 < package/own/patches/dhcp-kvr.patch
patch -p1 < package/own/patches/cgi-io.patch

# add upx
mv ./upx ./staging_dir/host/bin && chmod +x staging_dir/host/bin/upx

# Modify
sed -i 's/\"services\"/\"system\"/g' feeds/luci/applications/luci-app-ttyd/luasrc/controller/ttyd.lua
sed -i 's#("ttyd")#("ttyd"), 10#g' feeds/luci/applications/luci-app-ttyd/luasrc/controller/ttyd.lua

sed -i 's/\"services\"/\"nas\"/g' package/aliyunwebd/openwrt/luci-app-aliyundrive-webdav/luasrc/controller/aliyundrive-webdav.lua
sed -i 's/services/nas/g' package/aliyunwebd/openwrt/luci-app-aliyundrive-webdav/luasrc/view/aliyundrive-webdav/aliyundrive-webdav_log.htm
sed -i 's/services/nas/g' package/aliyunwebd/openwrt/luci-app-aliyundrive-webdav/luasrc/view/aliyundrive-webdav/aliyundrive-webdav_status.htm

sed -i 's/\"services\"/\"nas\"/g' package/aliyunfuse/openwrt/luci-app-aliyundrive-fuse/luasrc/controller/aliyundrive-fuse.lua
sed -i 's/services/nas/g' package/aliyunfuse/openwrt/luci-app-aliyundrive-fuse/luasrc/view/aliyundrive-fuse/aliyundrive-fuse_log.htm
sed -i 's/services/nas/g' package/aliyunfuse/openwrt/luci-app-aliyundrive-fuse/luasrc/view/aliyundrive-fuse/aliyundrive-fuse_status.htm

# golang
rm -rf ./feeds/packages/lang/golang && cp -r ./package/own/golang ./feeds/packages/lang
