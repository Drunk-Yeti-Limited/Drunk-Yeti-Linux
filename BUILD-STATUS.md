# Build evidence — 2026-10-26

| Check | Result |
| --- | --- |
| Debian/KDE live ISO build | Passed, run 40374303793 |
| Downloaded artifact ZIP SHA256 | Passed |
| Extracted ISO SHA256 | Passed |
| Two-part assembly and final ISO checksum | Passed |
| BIOS/UEFI boot structures | Both present |
| BIOS menu in VM | Observed at 60 and 120 seconds |
| Linux desktop boot | Pending corrected inspection run 40379229619 |
| UEFI desktop boot | Not tested |
| Physical hardware / Secure Boot | Not tested |
| Public release binary upload | Blocked by file transfer; no assets published |

ISO source: `f06555ca6613db653b36d195c6c1f5e2608e6a81`.

The first inspection run (40376897383) did not press Enter at the boot menu and timed out during QEMU monitor shutdown. This was a test defect, not evidence of a working or broken Linux desktop. A QMP-based inspection now sends Enter and captures up to five minutes of startup.

Native/model checks: 238 passed. Offscreen account/theme/atmosphere checks: 9 passed. The native smoke test passed. These do not replace actual account, billing, VM or hardware acceptance.

## Known limitations

- Development preview, not a complete 1.0 product.
- No disk installer, configured persistence or native ARM image.
- Recovered RC1 core plus newer integrations; the complete prior overhaul has not been recovered.
- Creative-suite source bundles are included, but some launchers and Linux exports are unfinished. Godot editor/export templates and the YHETI native C++ core are not fully packaged.
- Full Desktop Buddy behavior parity remains incomplete.
- Real purchases, sign-in, account switching and entitlement revocation need end-to-end testing. Theme preferences never replace backend ownership checks.
- Public binary upload failed because the upload environment supplied empty files despite verified nonempty local sources. Do not interpret an empty release draft as a downloadable ISO.
