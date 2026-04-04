ARG EMBY_TAG=latest
FROM emby/embyserver:${EMBY_TAG}

COPY Build/bin/Release/net8.0/EmbyPatch.dll /opt/embypatch/EmbyPatch.dll
COPY docker/emby/entrypoint.sh /usr/local/bin/embypatch-entrypoint.sh

RUN chmod +x /usr/local/bin/embypatch-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/embypatch-entrypoint.sh"]
