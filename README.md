## 集成Onlyoffice文档服务器的Nextcloud部署

## 需求
    * 最新版docker (下载链接：https://docs.docker.com/engine/installation/)
    * 最新版docker-compose (下载链接：https://docs.docker.com/compose/install/)

## 安装步骤

1. 获取代码库
    ```
    git clone https://github.com/gamedebug/docker-onlyoffice-nextcloud.git
    cd docker-onlyoffice-nextcloud
    ```
    
2. 运行Docker Compose
    ```
    docker-compose up -d
    ```
    
3. 打开浏览器访问localhost，并按界面向导完成快速设置。
4. 进入本地代码库文件夹执行安装后的设置脚本
    Linux或macOS系统：
    ```
    bash set_configuration.sh
    ```

    Windows系统：
    ```
    set_configuration.bat
    ```

现在集成了在线协同办公功能的Nextcloud就部署好了。
