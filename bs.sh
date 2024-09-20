#!/bin/bash

# 定义IP和对应文件的映射
declare -A ip_map=(
  ["194.156.98.189"]="s1.txt"
  ["194.156.99.125"]="s2.txt"
  ["194.246.114.72"]="s3.txt"
  ["194.246.114.88"]="s4.txt"
  ["194.246.114.90"]="s5.txt"
  ["45.8.146.106"]="s6.txt"
  ["45.8.146.84"]="s7.txt"
  ["45.8.146.94"]="s8.txt"
  ["5.180.24.108"]="s9.txt"
  ["5.180.24.77"]="s10.txt"
  ["85.208.110.59"]="s11.txt"
  ["85.209.153.35"]="s12.txt"
  ["85.209.153.43"]="s13.txt"
  ["88.218.93.159"]="s14.txt"
  ["88.218.93.179"]="s15.txt"
)

# 代理服务器地址
proxy="http://86.104.72.25:8080"

# 获取当前服务器的IP地址并判断是否在映射表中
current_ip=$(hostname -I | awk '{print $1}')
file="${ip_map[$current_ip]}"

if [[ -n "$file" ]]; then
    echo "当前服务器IP: $current_ip，匹配的文件: /root/upload/$file"
    
    # 使用 tmux 创建新会话并在后台运行命令
    tmux new-session -d "katana -u /root/V4scan/upload/$file -f qurl -aff -ef css,txt,md,js,jpg,png,ico,jpeg,pdf,google,github,microsoft,facebook,apple,bing,taobao --proxy=$proxy"
else
    echo "当前IP: $current_ip 未找到对应的文件映射，脚本退出。"
    exit 1
fi
