# Live session and VM instructions

The integration preview ISO is available in the [public pre-release](https://github.com/Drunk-Yeti-Limited/Drunk-Yeti-Linux/releases/tag/playspace-preview-2026-10-27). This image starts a live session and does not install Linux to disk.

## Assemble the download

Download both `drunk-yeti-integration-preview-amd64.hybrid.iso.part01` and `.part02`, plus `Assemble-ISO.command`, into the same folder. Allow at least 8 GB free for the parts and assembled image. In Terminal, change to that folder and run:

```sh
bash Assemble-ISO.command
```

The script verifies both parts, joins them and verifies the complete image. It works with Linux `sha256sum` or macOS `shasum`. Do not boot an image if verification fails. Checksums detect corruption; they are not digital signatures.

## Apple Silicon

Use an x86_64 **emulated** VM in UTM. ARM virtualization cannot boot this amd64 image. Select the assembled ISO as the VM's boot CD/DVD. Start with 4 GB RAM and two virtual CPU cores; these match the automated inspection configuration. Emulation performance on a Mac has not yet been measured.

Select **Live system (amd64)** and press Enter in the boot menu. A boot menu alone does not establish a working desktop. The image has no disk installer or configured persistence: copy important projects outside the live session before shutting down.

## Testing status

The rebuilt image reaches PlaySpace directly in the automated BIOS check, with the Yeti welcome interface visible at 600 seconds. The capture was still blank at 300 seconds. Plasma does not start as the desktop session. UEFI startup is untested. Package management, network, audio, graphics, account sign-in and all creative-app export paths need release acceptance. Start with a disposable VM; physical-hardware installation is not supported by this preview.

## Maintainers

The private source repository contains the automated Debian 13 live-build workflow. Build run 40430362637 produced the image from source f7622b2443fa2fef10fbf494191ad6c75012de29. The build uses a disposable privileged Debian container on a GitHub runner. Package inventories are staged inside the image; retain the original build log alongside release evidence.
