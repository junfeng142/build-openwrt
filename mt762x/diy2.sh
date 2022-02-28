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
# Change version for batman-adv
sed -i 's/2019.2/2017.3/g' feeds/routing/batman-adv/Makefile
sed -i 's/70c3f6a6cf88d2b25681a76768a52ed92d9fe992ba8e358368b6a8088757adc8/830edd297ff11b91623e9612172db3e2b2c1524e2f9b2ca1cb243e2e3f0ba4d4/g' feeds/routing/batman-adv/Makefile
