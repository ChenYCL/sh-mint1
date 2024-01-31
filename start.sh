#!/bin/bash

# 下载并解压
curl -o apphub-linux-arm64.tar.gz https://assets.coreservice.io/public/package/61/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz && tar -zxf apphub-linux-arm64.tar.gz && rm -f apphub-linux-arm64.tar.gz && cd ./apphub-linux-arm64

# 移除现有服务并安装新服务
sudo ./apphub service remove && sudo ./apphub service install

# 启动服务
sudo ./apphub service start
./apphub status
sudo ./apps/gaganode/gaganode config set --token=dsplkvwusnrtrbnvbcbe52adac6ced70
./apphub restart

# 检查应用状态
./apphub status | grep 'status:[RUNNING]'
if [ $? -ne 0 ]; then
    echo "Gaganode is not running."
    exit 1
else
    echo "Gaganode is running successfully."
fi
