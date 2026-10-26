#!/bin/bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
checksum() {
  if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | awk '{print $1}';
  else shasum -a 256 "$1" | awk '{print $1}'; fi
}
test -f 'drunk-yeti-integration-preview-amd64.hybrid.iso.part01' || { echo 'Missing drunk-yeti-integration-preview-amd64.hybrid.iso.part01'; exit 1; }
echo 'Checking drunk-yeti-integration-preview-amd64.hybrid.iso.part01'
test "$(checksum 'drunk-yeti-integration-preview-amd64.hybrid.iso.part01')" = 'f33e0521d5f53a167909ec233e05ad2dc8e66bbf6af6f0de5469a5644c3ee151' || { echo 'Part checksum mismatch. Download it again.'; exit 1; }
test -f 'drunk-yeti-integration-preview-amd64.hybrid.iso.part02' || { echo 'Missing drunk-yeti-integration-preview-amd64.hybrid.iso.part02'; exit 1; }
echo 'Checking drunk-yeti-integration-preview-amd64.hybrid.iso.part02'
test "$(checksum 'drunk-yeti-integration-preview-amd64.hybrid.iso.part02')" = '1a5a4167c53b4bce441afdf7b8b25d6232645e2b32f09a3155836cae930daedf' || { echo 'Part checksum mismatch. Download it again.'; exit 1; }
image='drunk-yeti-integration-preview-amd64.hybrid.iso'
expected='166d1ff8fddd74cfb8d359fff39b1e5f1a066af59455ff3e8705a21fbda62c42'
if test -e "$image"; then
  test "$(checksum "$image")" = "$expected" || { echo 'Existing ISO differs. Move it aside before retrying.'; exit 1; }
  echo 'Existing ISO verified.'; exit 0
fi
temp_image=$(mktemp './yeti-iso.XXXXXXXX')
trap 'rm -f -- "$temp_image"' EXIT
cat 'drunk-yeti-integration-preview-amd64.hybrid.iso.part01' 'drunk-yeti-integration-preview-amd64.hybrid.iso.part02' > "$temp_image"
test "$(checksum "$temp_image")" = "$expected" || { echo 'ISO checksum mismatch.'; exit 1; }
mv -- "$temp_image" "$image"
trap - EXIT
echo "Verified ISO ready: $image"
