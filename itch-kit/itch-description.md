# Drunk Yeti PlaySpace Linux

**Your desktop. Your PlaySpace.**

A useful Linux desktop with an optional game world, a Yeti companion, and a snowy alpine place to make yourself at home.

PlaySpace brings desktop tools and playful exploration into one interface. Open apps, browse files, use the terminal, or take a break in the world—ordinary desktop work never requires finishing a quest.

## Download the Linux preview

**[Download the tested ISO on GitHub](https://github.com/Drunk-Yeti-Limited/Drunk-Yeti-Linux/releases/tag/playspace-preview-2026-10-27)**

**[Public repository, screenshots, and setup instructions](https://github.com/Drunk-Yeti-Limited/Drunk-Yeti-Linux)**

The itch.io browser upload is a download landing page. The operating system itself is downloaded from GitHub.

## What’s in this preview?

- Debian 13 for amd64 / x86_64.
- Direct startup into the PlaySpace X11 session, without the Plasma desktop.
- A Yeti welcome experience, desktop shortcuts, and optional exploration.
- Yeti companion integration, with further behavior and app work still in progress.

## Get started

Download both ISO parts and `Assemble-ISO.command` from the same GitHub release into one folder. Allow at least **8 GB free**, then run:

```bash
bash Assemble-ISO.command
```

The script checks both parts and the assembled ISO. Windows assembly instructions are included in the release’s `READ-ME.txt`.

Try the verified image in a disposable VM with **4 GB RAM, 2 virtual CPU cores, and BIOS firmware**. Select **Live system (amd64)** and press Enter. On Apple Silicon, use **x86_64 emulation**, not ARM virtualization.

## Current status

**Development preview—not the finished release.** The rebuilt ISO reached PlaySpace in the BIOS VM test, with the welcome interface visible at ten minutes. Startup was still blank at five minutes in that test.

There is **no disk installer or configured persistence**. Save important files outside the live session before shutting down.

UEFI, Secure Boot, physical hardware, online account flows, and full application acceptance remain pending. Some creative-app launchers and companion integrations are unfinished, and the boot menu still displays Debian artwork.

Start with a VM and follow the current build notes on GitHub.
