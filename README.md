
# EmbyServer

该仓库负责构建并发布 Docker Hub 镜像 [`honue/embyserver`](https://hub.docker.com/r/honue/embyserver)。

## 发布状态

<!-- publish-state:start -->
| Tag | Published At (UTC+8) | Platforms |
| --- | --- | --- |
| beta | 2026-03-12 13:32:58 | linux/amd64, linux/arm/v7, linux/arm64 |
| latest | 2026-03-12 13:32:58 | linux/amd64 |
| 4.10.0.5 | 2026-03-12 13:32:58 | linux/amd64, linux/arm/v7, linux/arm64 |
<!-- publish-state:end -->

## Docker Compose 示例

```yaml
version: "3.3"

services:
  emby:
    image: honue/embyserver:latest
    container_name: emby
    network_mode: host
    volumes:
      - ./config:/config
      # 原有的dashboard-ui可以不用了
    environment:
      - SECRET_KEY=ILOVEEMBY
      - TZ=Asia/Shanghai
      - PUID=0
      - PGID=0
      - GIDLIST=0
    devices:
      - /dev/dri:/dev/dri
    restart: always
```

注意运行本插件，必须设置环境变量：

```bash
SECRET_KEY=ILOVEEMBY
```

## 手动安装

1. 从 Release 下载最新的 `EmbyHelper.dll`。
2. 将 `EmbyHelper.dll` 放到 Emby 的 `plugins` 目录。
3. 添加环境变量：
4. 重启 Emby。
5. 在插件页面确认插件已加载。

## 声明

本项目仅用于学习与研究。

如果你的经济条件允许，请支持 Emby 官方。
