# Build evidence — 2026-10-26

| Check | Result |
| --- | --- |
| Debian/KDE live ISO build | Passed, run 40374303793 |
| Downloaded artifact ZIP SHA256 | Passed |
| Extracted ISO SHA256 | Passed |
| Two-part assembly and final ISO checksum | Passed |
| BIOS/UEFI boot structures | Both present |
| BIOS menu in VM | Observed at 60 and 120 seconds |
| Linux desktop boot | KDE desktop and welcome screen visible at 300 seconds; run 40379229619 passed |
| Yeti shell autostart | Unverified: no Yeti UI visible in final capture |
| UEFI desktop boot | Not tested |
| Physical hardware / Secure Boot | Not tested |
| Public release binary upload | Published pre-release with six assets; all six server SHA256 digests match local files |

ISO source: `f06555ca6613db653b36d195c6c1f5e2608e6a81`.

The first inspection run (40376897383) did not press Enter at the boot menu and timed out during QEMU monitor shutdown. This was a test defect, not evidence of a working or broken Linux desktop. The corrected QMP inspection (40379229619) sent Enter, captured startup through five minutes, and shut down without timing out. The final screenshot shows KDE's desktop and welcome screen; this is not complete Yeti or app acceptance.

Native/model checks: 238 passed. Offscreen account/theme/atmosphere checks: 9 passed. The native smoke test passed. These do not replace actual account, billing, VM or hardware acceptance.

## Known limitations

- Development preview, not a complete 1.0 product.
- No disk installer, configured persistence or native ARM image.
- Recovered RC1 core plus newer integrations; the complete prior overhaul has not been recovered.
- Creative-suite source bundles are included, but some launchers and Linux exports are unfinished. Godot editor/export templates and the YHETI native C++ core are not fully packaged.
- Full Desktop Buddy behavior parity remains incomplete. The Yeti shell is not visible in the final VM capture; its autostart needs diagnosis and functional verification.
- Real purchases, sign-in, account switching and entitlement revocation need end-to-end testing. Theme preferences never replace backend ownership checks.
- Initial upload attempts saw empty files while synchronization was delayed. After synchronization completed, both ISO parts and four supporting files uploaded successfully. The [pre-release is now public](https://github.com/Drunk-Yeti-Limited/Drunk-Yeti-Linux/releases/tag/integration-preview-2026-10-26).
- The private build log was excluded after automatic upload review; it remains in the private build artifact.

## Maintainer upload fallback

`Prepare-Public-Release.command` downloads the exact successful private build using an authenticated GitHub CLI, verifies the ISO, splits and verifies both parts, and uploads them with checksums (the private build log is retained locally) to a **draft** pre-release in this public repository. Run it from a checkout of this repository on a machine with Python 3, GitHub CLI and at least 12 GB free. It does not publish the draft or overwrite an existing release. Review the boot evidence and assets before publishing. The original private build artifact expires on 2026-11-02; retain a verified local copy. The upload fallback was checked with valid and corrupted fixture images: valid input reached draft upload, while corrupted input was rejected before release creation.
