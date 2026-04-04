#!/bin/sh
set -eu

plugin_dir="${EMBY_PLUGIN_DIR:-/config/plugins}"
plugin_file="${plugin_dir}/EmbyPatch.dll"
source_file="/opt/embypatch/EmbyPatch.dll"

extract_version() {
    file_path="$1"
    if [ ! -f "${file_path}" ]; then
        return 1
    fi

    # .NET assembly versions are typically stored as ASCII metadata in the DLL.
    version="$(
        LC_ALL=C grep -aoE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "${file_path}" \
            | awk '!seen[$0]++' \
            | head -n 1
    )"

    if [ -n "${version}" ]; then
        printf '%s\n' "${version}"
        return 0
    fi

    return 1
}

version_gt() {
    left="$1"
    right="$2"

    awk -v left="${left}" -v right="${right}" '
        function split_version(input, output, count, i) {
            count = split(input, output, ".")
            for (i = count + 1; i <= 4; i++) {
                output[i] = 0
            }
            return 4
        }

        BEGIN {
            split_version(left, l)
            split_version(right, r)

            for (i = 1; i <= 4; i++) {
                if ((l[i] + 0) > (r[i] + 0)) {
                    exit 0
                }
                if ((l[i] + 0) < (r[i] + 0)) {
                    exit 1
                }
            }

            exit 1
        }
    '
}

mkdir -p "${plugin_dir}"
if [ ! -f "${plugin_file}" ]; then
    cp "${source_file}" "${plugin_file}"
else
    source_version="$(extract_version "${source_file}" || true)"
    target_version="$(extract_version "${plugin_file}" || true)"

    if [ -n "${source_version}" ] && [ -n "${target_version}" ]; then
        if version_gt "${source_version}" "${target_version}"; then
            cp "${source_file}" "${plugin_file}"
        fi
    elif [ ! -s "${plugin_file}" ]; then
        cp "${source_file}" "${plugin_file}"
    fi
fi

exec /init "$@"
