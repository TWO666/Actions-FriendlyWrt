#!/bin/bash

# 定义日志函数
log_info() {
    echo -e "\033[32m[INFO] $1\033[0m"
}

log_error() {
    echo -e "\033[31m[ERROR] $1\033[0m"
}

log_cmd() {
    echo -e "\033[33m[CMDOUT]\n$1\n\033[0m"
}

# 运行检测命令获取设备信息
output=$(./upgrade_tool ld 2>&1)

# 记录命令输出
log_cmd "$output"

# 提取设备数目
connected_number=$(echo "$output" | grep -oP '(?<=connected\()\d+(?=\))')

if [[ -z "$connected_number" ]]; then
    log_error "无法检测到连接的设备数量"
    exit 1
fi

# 判断连接的设备数
if [[ "$connected_number" -eq 0 ]]; then
    log_error "未连接设备"
    exit 1
elif [[ "$connected_number" -gt 1 ]]; then
    log_error "只支持单设备刷写"
    exit 1
else
    log_info "检测到 1 个设备，可以继续刷写"
    
    device_info=$(echo "$output" | grep 'DevNo=')

    # 提取 Vid, Pid 和 Mode
    vid=$(echo "$device_info" | grep -oP '(?<=Vid=)0x[0-9a-fA-F]+')
    pid=$(echo "$device_info" | grep -oP '(?<=Pid=)0x[0-9a-fA-F]+')
    mode=$(echo "$device_info" | grep -oP '(?<=Mode=)\w+')

    if [[ -z "$vid" || -z "$pid" || -z "$mode" ]]; then
        log_error "无法获取设备的 Vid, Pid 或 Mode 参数"
        exit 1
    fi

    # 判断 Vid, Pid 和 Mode 是否匹配
    if [[ "$vid" == "0x2207" && "$pid" == "0x330c" && "$mode" == "Maskrom" ]]; then
        log_info "设备信息符合要求 (Vid=0x2207, Pid=0x330c, Mode=Maskrom)，继续执行后续操作"
    else
        log_error "设备 Vid, Pid 或 Mode 不符合条件：(期望: Vid=0x2207, Pid=0x330c, Mode=Maskrom)"
        log_error "检测到的设备信息： Vid=$vid, Pid=$pid, Mode=$mode"
        exit 1
    fi
fi

# 文件列表
files=(
    "MiniLoaderAll.bin"
    "parameter.txt"
    "boot.img"
    "dtbo.img"
    "idbloader.img"
    "kernel.img"
    "misc.img"
    "resource.img"
    "rootfs.img"
    "trust.img"
    "uboot.img"
    "userdata.img"
)

# 检查所有所需文件是否存在，并记录缺失的文件
missing_files=()
for file in "${files[@]}"; do
    if [[ ! -f $file ]]; then
        missing_files+=("$file")
    fi
done

# 如果有任何文件缺失，报错并退出
if [[ ${#missing_files[@]} -gt 0 ]]; then
    log_error "以下文件不存在: ${missing_files[*]}"
    exit 1
fi

log_info "所有文件都存在，开始刷机操作"

# 定义一个函数来运行命令并检查是否成功
run_command() {
    local description="$1"
    local command="$2"

    log_info "执行: $description"
    eval "$command"
    if [[ $? -eq 0 ]]; then
        log_info "$description 成功"
    else
        log_error "$description 失败"
        exit 1
    fi
}

# 执行所有的刷写命令
run_command "擦除设备" "./upgrade_tool EF MiniLoaderAll.bin"
run_command "升级 MiniLoaderAll.bin" "./upgrade_tool ul MiniLoaderAll.bin -noreset"
run_command "刷写参数 parameter.txt" "./upgrade_tool di -p parameter.txt"
run_command "刷写引导 boot.img" "./upgrade_tool di -boot boot.img"
run_command "刷写 dtbo.img" "./upgrade_tool di -dtbo dtbo.img"
run_command "刷写 idbloader.img" "./upgrade_tool di -idbloader idbloader.img"
run_command "刷写 kernel.img" "./upgrade_tool di -kernel kernel.img"
run_command "刷写 misc.img" "./upgrade_tool di -misc misc.img"
run_command "刷写 resource.img" "./upgrade_tool di -resource resource.img"
run_command "刷写 rootfs.img" "./upgrade_tool di -rootfs rootfs.img"
run_command "刷写 trust.img" "./upgrade_tool di -trust trust.img"
run_command "刷写 uboot.img" "./upgrade_tool di -uboot uboot.img"
run_command "刷写 userdata.img" "./upgrade_tool di -userdata userdata.img"
run_command "重置设备" "./upgrade_tool rd"

log_info "刷机操作全部完成"

log_info "设备将自动重启...."
