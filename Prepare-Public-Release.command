#!/bin/bash
# Maintainer recovery path when browser uploads cannot access local files.
# Requires GitHub CLI authentication with access to both named repositories.
set -euo pipefail
cd -- "$(dirname -- "$0")"
command -v gh >/dev/null || { echo 'Install the GitHub CLI, then run gh auth login first.'; exit 1; }
command -v python3 >/dev/null || { echo 'Python 3 is required.'; exit 1; }
gh auth status >/dev/null
repository='Drunk-Yeti-Limited/Drunk-Yeti-Linux'
tag='integration-preview-2026-10-26'
# Never overwrite an existing release or its assets.
if gh release view "$tag" --repo "$repository" >/dev/null 2>&1; then
  echo "Release $tag already exists. Inspect it before uploading again."; exit 1
fi
work_dir=$(mktemp -d './yeti-public-release.XXXXXXXX')
echo "Preparing files in $work_dir (allow 12 GB free)."
# Retain this directory on failure so a large download is not lost.
gh run download 40374303793 --repo Drunk-Yeti-Limited/DrunkYetiPlaySpace-Source --name drunk-yeti-development-iso --dir "$work_dir/download"
python3 - "$work_dir" <<'PY'
import hashlib, json, pathlib, sys
work = pathlib.Path(sys.argv[1])
manifest = json.loads(pathlib.Path('release-manifest.json').read_text())
source = work / 'download' / manifest['iso']
def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(8 * 1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()
if source.stat().st_size != manifest['size'] or digest(source) != manifest['sha256']:
    raise SystemExit('Downloaded ISO failed verification; no release was created.')
with source.open('rb') as stream:
    for part in manifest['parts']:
        output = work / part['name']
        remaining = part['size']
        with output.open('xb') as target:
            while remaining:
                chunk = stream.read(min(8 * 1024 * 1024, remaining))
                if not chunk:
                    raise SystemExit('Unexpected end of ISO')
                target.write(chunk)
                remaining -= len(chunk)
        if digest(output) != part['sha256']:
            raise SystemExit('Part verification failed; no release was created.')
    if stream.read(1):
        raise SystemExit('Unexpected extra ISO bytes')
PY
# A draft keeps unverified boot acceptance separate from public availability.
gh release create "$tag" --repo "$repository" --draft --prerelease \
  --title 'Drunk Yeti Linux — Integration Preview 2026-10-26' \
  --notes-file BUILD-STATUS.md \
  "$work_dir/"*.part01 "$work_dir/"*.part02 \
  Assemble-ISO.command SHA256SUMS release-manifest.json
echo 'Uploaded to a draft pre-release. Review assets and boot evidence before publishing.'
gh release view "$tag" --repo "$repository"
