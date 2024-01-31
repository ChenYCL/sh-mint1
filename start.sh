#!/bin/bash

# 下载并解压
curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz
tar -zxf apphub-linux-amd64.tar.gz
rm -f apphub-linux-amd64.tar.gz
cd ./apphub-linux-amd64

# 移除现有服务并安装新服务
sudo ./apphub service remove
sudo ./apphub service install

# 启动服务
sudo ./apphub service start

# 检查应用状态
./apphub status | grep 'gaganode status is RUNNING'
if [ $? -ne 0 ]; then
    echo "Gaganode is not running."
    exit 1
fi

# 设置token
sudo ./apps/gaganode/gaganode config set --token=dsplkvwusnrtrbnvbcbe52adac6ced70

# 重启应用
sudo ./apphub restart

echo "Gaganode has been installed and started successfully."
