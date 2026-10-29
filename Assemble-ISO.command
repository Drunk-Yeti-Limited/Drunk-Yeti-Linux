#!/bin/bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
checksum() { if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | awk '{print $1}'; else shasum -a 256 "$1" | awk '{print $1}'; fi; }
test -f 'drunk-yeti-integration-preview-amd64.hybrid.iso.part01' || { echo 'Missing drunk-yeti-integration-preview-amd64.hybrid.iso.part01'; exit 1; }
test "$(checksum 'drunk-yeti-integration-preview-amd64.hybrid.iso.part01')" = 'd2df6f09185ed02ead3dd8f4470bff4ac30a76e2f9cffccd2f9eef89eb1447c8' || { echo 'Part checksum mismatch'; exit 1; }
test -f 'drunk-yeti-integration-preview-amd64.hybrid.iso.part02' || { echo 'Missing drunk-yeti-integration-preview-amd64.hybrid.iso.part02'; exit 1; }
test "$(checksum 'drunk-yeti-integration-preview-amd64.hybrid.iso.part02')" = '452853c259a6a1e9cd843aaea2bce560c1ca1d7d75a6703266d9e1310c4cc448' || { echo 'Part checksum mismatch'; exit 1; }
image='drunk-yeti-integration-preview-amd64.hybrid.iso'
expected='ca7935534d004c8b35228606eba36c75621d3ced5f1da2b34c21623dfb8f0f04'
if test -e "$image"; then
 test "$(checksum "$image")" = "$expected" || { echo 'Existing ISO differs. Move it aside first.'; exit 1; }
 echo 'Existing ISO verified.'; exit 0
fi
temp_image=$(mktemp './yeti-iso.XXXXXXXX')
trap 'rm -f -- "$temp_image"' EXIT
cat 'drunk-yeti-integration-preview-amd64.hybrid.iso.part01' 'drunk-yeti-integration-preview-amd64.hybrid.iso.part02' > "$temp_image"
test "$(checksum "$temp_image")" = "$expected" || { echo 'ISO checksum mismatch'; exit 1; }
mv -- "$temp_image" "$image"
trap - EXIT
echo "Verified ISO ready: $image"
