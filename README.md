# Fork FriendlyELEC 编译R4SE固件

`build.yml` 施工中


## 特性

在FriendlyWrt 23.05 docker版本基础上：

- 去除`luci-app-adblock`
- 去除`luci-app-aria2`
- 去除`luci-app-ddns`
- 去除`luci-app-smartdns`
- 去除`luci-app-nft-qos`
- 去除`luci-app-sqm`
- 去除`luci-app-samba4`
- 保留en、zh_Hans语言包，去除其他语言包
- 保留`luci-app-diskman`
- 保留`luci-theme-argon`
- 添加`luci-app-argon-config`(unsplash源修改)
- 添加`luci-app-turboacc`(无DNS相关功能)
- 添加`luci-app-passxxxx`(仅x)

## 说明
- **刷机有风险，操作需谨慎**
- 仅用于`R4SE`
- 提供`Windows`和`Linux`平台的`USB线刷`固件
- img镜像可用于eMMC和SD，若要从eMMC启动并使用SD卡扩展存储，`务必不带系统并使用GPT分区`
- `不支持SD刷eMMC`
- 线刷之前，请`务必拔出SD卡`
- `Linux线刷`，下载解压，进入`MaskRom`模式（参照[官方教程](https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R4SE/zh#.E6.96.B9.E6.B3.953:_.E9.80.9A.E8.BF.87USB.E7.83.A7.E5.86.99)），运行`./R4SE_flash.sh`。
- `Linux线刷`（仅支持单设备刷写）（其他问题提issue）
- `Windows线刷`，参照[官方教程](https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R4SE/zh#.E6.96.B9.E6.B3.953:_.E9.80.9A.E8.BF.87USB.E7.83.A7.E5.86.99)
- `不接受任何添加软件包添加特性的请求`
- 不定期更新（当前更新时间：2024.09.08）


# 使用 GitHub Actions 编译 FriendlyWrt
[English](README_en.md)
### 基本信息 
- 用户名：root
- 密码：password
- 后台IP：192.168.2.1
- 固件下载地址： https://github.com/friendlyarm/Actions-FriendlyWrt/releases
- 更多使用说明: https://wiki.friendlyelec.com/wiki/index.php/Template:FriendlyWrt21/zh
### 固件说明
- 同一固件文件同时支持安装至SD和eMMC，不作区分
### 如何将固件写入eMMC  
- 先将固件写入一张SD卡，然后从SD启动系统，访问FriendyWrt后台页面，进入菜单“系统”->“eMMC刷机助手”，上传固件文件直接刷入即可，文件无需解压，写入完成后，将SD卡弹出, 设备会自动重启并从eMMC引导系统。
### 更新说明
* 2024/08/30
    *  更新到新版本 openwrt-23.05.4
    *  增加 NanoPi-M6 支持
* 2024/07/03
    *  修复因固件丢失而导致的WIFI问题
* 2024/06/06
    *  RK35xx内核更新至6.1.57
* 2024/03/29
    *  更新到新版本 openwrt-23.05.3
* 2024/02/02
    *  为模块rtl8822ce增加无线中继模式的支持,[设置方法](https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R5C/zh#.E6.97.A0.E7.BA.BF.E4.B8.AD.E7.BB.A7.E6.A8.A1.E5.BC.8F)
* 2023/12/22
    *  更新到新版本 openwrt-23.05.2
    *  修正eMMC刷机工具对大容量eMMC的兼容性问题
* 2023/10/31
    *  更新到新版本 openwrt-23.05.0
    *  内核更新至6.1
* 2023/07/04
    *  内核更新至5.10.160 (rk3568/rk3588)
* 2023/06/10
    *  增加 MediaTek MT7921 无线网卡的支持
* 2023/05/31
    *  增加 NanoPC-T6 支持
    *  更新 v22.03 到新版本 openwrt-22.03.5
    *  更新 v21.02 到新版本 openwrt-21.02.7
* 2023/04/26
    *  增加 R5C-2GB 支持
    *  更新 v22.03 到新版本 openwrt-22.03.4
    *  更新 v21.02 到新版本 openwrt-21.02.6
* 2023/03/15
    *  增加R6C支持
    *  更新initramfs,[可禁用OverlayFS或者创建额外的分区](https://wiki.friendlyelec.com/wiki/index.php/How_to_use_overlayfs_on_Linux/zh)
* 2023/03/01
    *  更新到新版本 openwrt-22.03.3
    *  为rk3568/rk3588的5.10内核增加ntfs3驱动
    *  更新内核小版本
    *  更新网卡驱动
* 2022/12/04
    *  增加R5C支持
    *  修正存储空间某些情况下无法扩展的问题
    *  加强eMMC刷机工具的刷机稳定性
* 2022/11/24
    *  修正R6S 1G网口不可用问题  
    *  eMMC刷机工具现可以在eMMC启动时使用  
* 2022/11/01 增加R6S支持
* 2022/10/09 首次发布
### Thanks / 致谢
- [luci-app-diskman](https://github.com/lisaac/luci-app-diskman)
- [luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [NanoPi-R1S-Build-By-Actions](https://github.com/skytotwo/NanoPi-R1S-Build-By-Actions)
- [QiuSimons](https://github.com/QiuSimons/YAOF)
