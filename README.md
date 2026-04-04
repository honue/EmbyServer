
# EmbyServer

该仓库负责构建并发布 Docker Hub 镜像 [`honue/embyserver`](https://hub.docker.com/r/honue/embyserver)。

## 发布状态

<!-- publish-state:start -->
| Tag | Published At (UTC+8) | Official Platform SHA1 |
| --- | --- | --- |
<!-- publish-state:end -->

## Docker Compose 示例

```yaml
services:
  emby:
    image: honue/embyserver:latest
    container_name: emby
    network_mode: host
    volumes:
      - ./config:/config
    environment:
      - TZ=Asia/Shanghai
      - UID=0
      - GID=0
    devices:
      - /dev/dri:/dev/dri
    restart: always
```

## 其他镜像安装

1. 从 Release 下载最新的 `EmbyPatch.dll`。
2. 将 `EmbyPatch.dll` 放到 Emby 的 `plugins` 目录。
3. 重启 Emby。
4. 在插件页面确认插件已加载。

## 声明

本镜像不会向任何第三方服务器发送任何请求，所有激活操作均由插件在本地处理。

本项目仅用于学习与研究，请支持 Emby 官方。
