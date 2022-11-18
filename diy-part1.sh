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
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i "/helloworld/d" "feeds.conf.default"
# echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
# sed -i "/helloworld/d" feeds.conf.default
echo 'src-git-full helloworld https://github.com/caonimagfw/helloworld.git' >> feeds.conf.default

# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall;packages' >>feeds.conf.default
# echo 'src-git passwallluci https://github.com/xiaorouji/openwrt-passwall;luci' >>feeds.conf.default
# git clone https://github.com/w311ang/openwrt-tcp2udp.git package/tcp2udp
# git clone https://github.com/w311ang/openwrt-ipportfwd.git package/ipportfwd
