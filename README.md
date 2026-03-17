
# EmbyServer

该仓库负责构建并发布 Docker Hub 镜像 [`honue/embyserver`](https://hub.docker.com/r/honue/embyserver)。

## 发布状态

<!-- publish-state:start -->
| Tag | Published At (UTC+8) | Official Platform SHA1 |
| --- | --- | --- |
| beta | 2026-03-17 18:55:13 | `linux/amd64: sha1 7f089f355bd5`<br>`linux/arm/v7: sha1 f6b785df3f9a`<br>`linux/arm64: sha1 77d34fecfac5` |
| latest | 2026-03-12 15:05:01 | `linux/amd64: sha1 338a17ad65a8` |
| 4.10.0.6 | 2026-03-17 18:55:13 | `linux/amd64: sha1 7f089f355bd5`<br>`linux/arm/v7: sha1 f6b785df3f9a`<br>`linux/arm64: sha1 77d34fecfac5` |
| 4.10.0.5 | 2026-03-12 15:05:01 | `linux/amd64: sha1 3965d3fe5953`<br>`linux/arm/v7: sha1 61f2f76b5200`<br>`linux/arm64: sha1 83a46130f00c` |
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
    environment:
      - TZ=Asia/Shanghai
      - PUID=0
      - PGID=0
      - GIDLIST=0
    devices:
      - /dev/dri:/dev/dri
    restart: always
```
- Docker镜像内置插件，另外可以不用映射`dashboard-ui`文件夹，插件也处理了 Emby Web 跨域问题。

## 其他镜像安装

1. 从 Release 下载最新的 `EmbyPatch.dll`。
2. 将 `EmbyPatch.dll` 放到 Emby 的 `plugins` 目录。
3. 重启 Emby。
4. 在插件页面确认插件已加载。

## 声明

本项目仅用于学习与研究，请支持 Emby 官方。
