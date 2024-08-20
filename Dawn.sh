#!/bin/bash

# 更新包列表
sudo apt update

# 检查是否已经安装 Go
if ! command -v go &> /dev/null
then
    echo "Go 未安装，开始安装..."
    sudo apt install -y golang-go
else
    echo "Go 已经安装，跳过安装。"
fi

# 克隆项目
git clone https://github.com/sdohuajia/Dawn-main.git

# 进入项目目录
cd Dawn

# 下载 Go 依赖
go mod download

# 打开配置文件以供编辑
echo "请编辑 conf.toml 文件。完成编辑后，按任意键继续..."
nano conf.toml

# 等待用户按任意键继续
read -n 1 -s -r -p "按任意键继续..."

# 构建项目
echo "构建项目..."
go build -o main .

# 执行项目
echo "执行项目..."
./main
