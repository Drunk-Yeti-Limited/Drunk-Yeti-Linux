# Drunk Yeti PlaySpace Linux

A useful Linux desktop with an optional game world, desktop companion and creative tools.

**Development integration preview — ISO built; public binary upload and desktop acceptance remain pending. This is not the finished 1.0 release.**

The 2026-10-26 Debian 13/KDE amd64 image is 3,959,422,976 bytes. Its SHA256 is:

```text
166d1ff8fddd74cfb8d359fff39b1e5f1a066af59455ff3e8705a21fbda62c42
```

The downloaded ISO and two-part reassembly have been verified. BIOS and UEFI boot entries are present. The first VM inspection reached the live boot menu; a corrected test is checking the actual Linux desktop. Presence of boot entries is not proof of successful UEFI boot.

Included work: Yeti desktop shell, account and owned-theme integration, optional snow and stars, and recovered creative-suite sources. Some suite launchers and Linux export workflows remain incomplete. No disk installer, configured persistence or native ARM image is included.

Large binaries will be attached to a GitHub pre-release as two parts. They are not stored in this Git repository. No public ISO assets have been uploaded yet.

- [Live-session and Apple Silicon VM instructions](INSTALLATION.md)
- [Exact image and part manifest](release-manifest.json)
- [Build evidence and known issues](BUILD-STATUS.md)
- [Release acceptance](RELEASE-CHECKLIST.md)

Application development source remains private.
