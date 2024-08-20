#!/bin/bash

# ���°��б�
sudo apt update

# ����Ƿ��Ѿ���װ Go
if ! command -v go &> /dev/null
then
    echo "Go δ��װ����ʼ��װ..."
    sudo apt install -y golang-go
else
    echo "Go �Ѿ���װ��������װ��"
fi

# ��¡��Ŀ
git clone https://github.com/sdohuajia/Dawn-main.git

# ������ĿĿ¼
cd Dawn

# ���� Go ����
go mod download

# �������ļ��Թ��༭
echo "��༭ conf.toml �ļ�����ɱ༭�󣬰����������..."
nano conf.toml

# �ȴ��û������������
read -n 1 -s -r -p "�����������..."

# ������Ŀ
echo "������Ŀ..."
go build -o main .

# ִ����Ŀ
echo "ִ����Ŀ..."
./main
