# Drunk Yeti PlaySpace Linux

A useful Linux desktop with an optional game world, desktop companion and creative tools.

**Development integration preview — [download the ISO parts and assembly script](https://github.com/Drunk-Yeti-Limited/Drunk-Yeti-Linux/releases/tag/integration-preview-2026-10-26). This is not the finished 1.0 release.**

The 2026-10-26 Debian 13/KDE amd64 image is 3,959,422,976 bytes. Its SHA256 is:

```text
166d1ff8fddd74cfb8d359fff39b1e5f1a066af59455ff3e8705a21fbda62c42
```

The downloaded ISO and two-part reassembly have been verified. BIOS and UEFI boot entries are present. The corrected BIOS VM test reached the KDE desktop at 300 seconds. Yeti shell autostart remains unverified because the capture shows KDE's welcome screen. Presence of boot entries is not proof of successful UEFI boot.

Included work: Yeti desktop shell, account and owned-theme integration, optional snow and stars, and recovered creative-suite sources. Some suite launchers and Linux export workflows remain incomplete. No disk installer, configured persistence or native ARM image is included.

Both ISO parts, the assembly script, checksums, manifest and readme are published in the pre-release. All six GitHub asset SHA256 digests match their local verified files. Large binaries are release assets, not Git blobs.

- [Live-session and Apple Silicon VM instructions](INSTALLATION.md)
- [Exact image and part manifest](release-manifest.json)
- [Build evidence and known issues](BUILD-STATUS.md)
- [Release acceptance](RELEASE-CHECKLIST.md)

Application development source remains private.
