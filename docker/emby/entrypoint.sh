#!/bin/sh
set -eu

plugin_dir="${EMBY_PLUGIN_DIR:-/config/plugins}"
plugin_file="${plugin_dir}/EmbyPatch.dll"
source_file="/opt/embypatch/EmbyPatch.dll"

mkdir -p "${plugin_dir}"
cp -f "${source_file}" "${plugin_file}"

exec /init "$@"
