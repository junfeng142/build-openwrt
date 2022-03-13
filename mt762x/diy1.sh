
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
sed -i '/network/s/^/#/g' package/my/default-settings/files/zzz-default-settings
# adbyby
sed -i '/uclient-fetch/wget-ssl/g' package/my/luci-app-adbyby-plus/root/usr/share/adbyby/adblock.sh
sed -i '/uclient-fetch/wget-ssl/g' package/my/luci-app-adbyby-plus/root/usr/share/adbyby/adbybyupdate.sh
sed -i '/uclient-fetch/wget-ssl/g' package/my/luci-app-adbyby-plus/root/usr/share/adbyby/admem.sh
sed -i '/uclient-fetch/wget-ssl/g' package/my/luci-app-adbyby-plus/root/usr/share/adbyby/adupdate.sh
sed -i '/uclient-fetch/wget-ssl/g' package/my/luci-app-adbyby-plus/root/usr/share/adbyby/rule-update
