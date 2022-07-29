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

# Modify default settings
cp $GITHUB_WORKSPACE/default-settings .
echo >> default-settings
sed -n -i -e '/rm -rf \/tmp\/luci-modulecache\//r default-settings' -e 1x -e '2,${x;p}' -e '${x;p}' package/lean/default-settings/files/zzz-default-settings
rm default-settings

# Patch
for i in $GITHUB_WORKSPACE/patches/*; do patch -p0 < $i; done

#打开bbr加速
sed -i "s/option bbr_cca '0'/option bbr_cca '1'/" feeds/luci/applications/luci-app-turboacc/root/etc/config/turboacc

#清空ssrplus黑名单
echo > package/feeds/helloworld/luci-app-ssr-plus/root/etc/ssrplus/deny.list
