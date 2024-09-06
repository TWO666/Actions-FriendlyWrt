#!/bin/bash

# lang
cat << 'EOF' | tee configs/rockchip/02-luci_lang
# CONFIG_LUCI_LANG_bg is not set
# CONFIG_LUCI_LANG_ca is not set
# CONFIG_LUCI_LANG_cs is not set
# CONFIG_LUCI_LANG_de is not set
# CONFIG_LUCI_LANG_el is not set
CONFIG_LUCI_LANG_en=y
# CONFIG_LUCI_LANG_es is not set
# CONFIG_LUCI_LANG_fr is not set
# CONFIG_LUCI_LANG_he is not set
# CONFIG_LUCI_LANG_hi is not set
# CONFIG_LUCI_LANG_hu is not set
# CONFIG_LUCI_LANG_it is not set
# CONFIG_LUCI_LANG_ja is not set
# CONFIG_LUCI_LANG_ko is not set
# CONFIG_LUCI_LANG_mr is not set
# CONFIG_LUCI_LANG_ms is not set
# CONFIG_LUCI_LANG_pl is not set
# CONFIG_LUCI_LANG_pt is not set
# CONFIG_LUCI_LANG_pt_BR is not set
# CONFIG_LUCI_LANG_ro is not set
# CONFIG_LUCI_LANG_ru is not set
# CONFIG_LUCI_LANG_sk is not set
# CONFIG_LUCI_LANG_sv is not set
# CONFIG_LUCI_LANG_tr is not set
# CONFIG_LUCI_LANG_uk is not set
# CONFIG_LUCI_LANG_vi is not set
CONFIG_LUCI_LANG_zh_Hans=y
# CONFIG_LUCI_LANG_zh_Hant is not set
EOF

sed -i -e '/CONFIG_MAKE_TOOLCHAIN=y/d' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_IB=y/# CONFIG_IB is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_SDK=y/# CONFIG_SDK is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_TARGET_ROOTFS_PARTSIZE=512/CONFIG_TARGET_ROOTFS_PARTSIZE=2048/g' configs/rockchip/01-nanopi

sed -i -e 's/CONFIG_PACKAGE_luci-app-adblock=y/# CONFIG_PACKAGE_luci-app-adblock is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_PACKAGE_adblock=y/# CONFIG_PACKAGE_adblock is not set/g' configs/rockchip/01-nanopi

sed -i -e 's/CONFIG_PACKAGE_luci-app-aria2=y/# CONFIG_PACKAGE_luci-app-aria2 is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_PACKAGE_aria2=y/# CONFIG_PACKAGE_aria2 is not set/g' configs/rockchip/01-nanopi

sed -i -e 's/CONFIG_PACKAGE_luci-app-ddns=y/# CONFIG_PACKAGE_luci-app-ddns is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_PACKAGE_ddns-scripts=y/# CONFIG_PACKAGE_ddns-scripts is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_PACKAGE_ddns-scripts-services=y/# CONFIG_PACKAGE_ddns-scripts-services is not set/g' configs/rockchip/01-nanopi

sed -i -e 's/CONFIG_PACKAGE_luci-app-smartdns=y/# CONFIG_PACKAGE_luci-app-smartdns is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_PACKAGE_smartdns=y/# CONFIG_PACKAGE_smartdns is not set/g' configs/rockchip/01-nanopi

# sed -i -e 's/CONFIG_PACKAGE_luci-app-nft-qos=y/# CONFIG_PACKAGE_luci-app-nft-qos is not set/g' configs/rockchip/01-nanopi
# sed -i -e 's/CONFIG_PACKAGE_nft-qos=y/# CONFIG_PACKAGE_nft-qos is not set/g' configs/rockchip/01-nanopi

# sed -i -e 's/CONFIG_PACKAGE_luci-app-sqm=y/# CONFIG_PACKAGE_luci-app-sqm is not set/g' configs/rockchip/01-nanopi
# sed -i -e 's/CONFIG_PACKAGE_sqm-scripts=y/# CONFIG_PACKAGE_sqm-scripts is not set/g' configs/rockchip/01-nanopi

# sed -i -e 's/CONFIG_PACKAGE_luci-app-samba4=y/# CONFIG_PACKAGE_luci-app-samba4 is not set/g' configs/rockchip/01-nanopi
# sed -i -e 's/CONFIG_PACKAGE_samba4-libs=y/# CONFIG_PACKAGE_samba4-libs is not set/g' configs/rockchip/01-nanopi
# sed -i -e 's/CONFIG_PACKAGE_samba4-server=y/# CONFIG_PACKAGE_samba4-server is not set/g' configs/rockchip/01-nanopi
# sed -i -e 's/=y/#  is not set/g' configs/rockchip/01-nanopi
