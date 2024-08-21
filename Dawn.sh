#!/bin/bash

# 主菜单函数
function main_menu() {
    while true; do
        clear
        echo "脚本由大赌社区哈哈哈哈编写，推特 @ferdie_jhovie，免费开源，请勿相信收费"
        echo "================================================================"
        echo "节点社区 Telegram 群组: https://t.me/niuwuriji"
        echo "节点社区 Telegram 频道: https://t.me/niuwuriji"
        echo "节点社区 Discord 社群: https://discord.gg/GbMV5EcNWF"
        echo "退出脚本，请按键盘 ctrl + C 退出即可"
        echo "请选择要执行的操作:"
        echo "1) 安装并启动 Dawn"
        echo "2) 退出"

        read -p "请输入选项 [1-2]: " choice

        case $choice in
            1)
                install_and_start_dawn
                ;;
            2)
                echo "退出脚本..."
                exit 0
                ;;
            *)
                echo "无效选项，请重新选择。"
                ;;
        esac
    done
}

# 安装 Go 环境并启动 Dawn 的函数
function install_and_start_dawn() {
    echo "更新包列表..."
    sudo apt update

    # 卸载已有 Go 版本（如果有的话）
    if command -v go &> /dev/null
    then
        echo "Go 已经安装，开始卸载旧版本..."
        sudo apt remove -y golang-go
    fi

    echo "安装指定版本的 Go..."
    GO_VERSION="1.22.3"
    GO_TAR="go$GO_VERSION.linux-amd64.tar.gz"
    wget "https://golang.org/dl/$GO_TAR"
    sudo tar -C /usr/local -xzf $GO_TAR

    # 设置环境变量
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc

    # 验证 Go 版本
    go version

    echo "克隆项目..."
    git clone https://github.com/sdohuajia/Dawn-main.git
    cd Dawn-main || { echo "无法进入 Dawn-main 目录"; exit 1; }

    echo "下载 Go 依赖..."
    go mod download

    echo "请编辑 conf.toml 文件。完成编辑后，按任意键继续..."
    nano conf.toml

    read -n 1 -s -r -p "按任意键继续..."

    echo "构建项目..."
    go build -o main .

    echo "执行项目..."
    ./main

    # 等待用户按任意键返回主菜单
    read -n 1 -s -r -p "项目执行完成。按任意键返回主菜单..."
}

# 运行主菜单
main_menu
