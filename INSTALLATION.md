# Installation and VM guidance

There is no installable release yet. Current work targets a Debian 13/KDE amd64 live image. It does not currently include a disk installer or configured persistence.

## When an ISO is published

1. Download the ISO and its SHA256SUMS from the same GitHub Release.
2. On Linux run `sha256sum -c SHA256SUMS`. On macOS run `shasum -a 256 NAME.iso` and compare the full digest with the manifest. A checksum detects corruption; it is not a digital signature.
3. Test the live image in a disposable VM before using physical hardware. Never attach a disk containing important data to an untested image.
4. Use the release's architecture and VM instructions. The planned amd64 image needs x86_64 emulation on Apple Silicon; ARM virtualization cannot boot it natively. No Apple Silicon ARM image is available.
5. A live session is not installation. Saving changes across reboots needs a documented persistence setup, which remains unfinished.

## Maintainer build requirements

The image builder needs a disposable Debian 13 amd64 machine with root/mount capability, at least 60 GiB free space, and live-build, debootstrap, xorriso, squashfs-tools, grub-pc-bin, grub-efi-amd64-bin and mtools. Source payload, app dependencies and toolchain must be staged and verified first. Maintainers must complete BIOS and UEFI boot tests before attaching an ISO here.

The current development container fails that preflight. There is no ISO download link to provide yet.
