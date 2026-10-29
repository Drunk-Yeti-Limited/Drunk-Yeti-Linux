# Current boot evidence — PlaySpace rebuild

**The rebuilt ISO reaches the PlaySpace interface in the normal BIOS VM boot test.** [See the actual screenshots](docs/screenshots/README.md).

- ISO source: `f7622b2443fa2fef10fbf494191ad6c75012de29`.
- Build and normal boot inspection: `40430362637`; both jobs completed successfully.
- Normal capture: blank at 300 seconds; PlaySpace and Yeti welcome visible at 600 seconds.
- Screenshot artifact: `12702889016`; downloaded ZIP digest verified against GitHub.
- Separate session check: `40432406032`, completed successfully.
- The repaired session selects PlaySpace X11 and removes the live-config Plasma override.
- The boot menu still shows Debian artwork. Full branding acceptance, UEFI, hardware and full feature testing remain pending.
- **Public replacement published:** the tested image is available in [the PlaySpace preview release](https://github.com/Drunk-Yeti-Limited/Drunk-Yeti-Linux/releases/tag/playspace-preview-2026-10-27). Its two parts reassemble to the exact verified ISO. The October 26 KDE release is retained as historical.

The earlier black-screen diagnosis found Plasma Wayland selected instead of PlaySpace, with graphics initialization errors. That earlier result is retained below as historical evidence and does not describe the rebuilt image's final screenshot.

---

## Historical build notes

# Build evidence — 2026-10-26

## Rebuilt autostart candidate

| Check | Result |
| --- | --- |
| Source revision | `c94989fcc2984516338f66048875418006663ca7` |
| ISO compilation | Passed; build run `40387571504`, ISO job `121799824182` |
| Autostart staging fixture | Passed in the ISO build |
| ISO checksum after artifact download | Passed in boot-only run `40393334355` |
| Initial chained boot attempt | Timed out during QEMU package download before VM launch; no screenshots |
| Boot-only retry | Capture workflow completed; run `40393334355`, harness `1e5bc7a` |
| Linux startup | Visible console; live-config finished and SDDM started by the 180-second capture |
| Graphical desktop | **Acceptance not passed:** black screen with pointer at 300 seconds; black at 600 seconds |
| Yeti autostart | **Unverified:** neither Yeti nor KDE appears in the later captures |
| Startup-log collection | Attempted through Konsole; resulting image is black, with no readable log |
| Public replacement | Not published; the original public release remains unchanged |

The test used Q35/BIOS, 4 GB RAM, 2 vCPUs, standard VGA and no network. The harness selects KVM when accessible, otherwise Nehalem emulation. These captures do not distinguish a display/session problem from an application-startup problem. No normal-user sandbox override was introduced.

The first runner's slow downloads exhausted its 25-minute budget. Both boot workflows now allow 45 minutes and install QEMU/xorriso without optional recommended packages. The retry completed, but a successful image-capture job is not successful desktop acceptance.

[New screenshots and provenance](docs/screenshots/README.md). Artifact `12686781195`, ZIP SHA256 `ed1e1ef0ab5c72ede92ba4d88367d2c222bed7558a2e2a0692a79d45d2b80b0c`; downloaded and verified before conversion to PNG.

Next diagnostic work: obtain guest display-manager/session journals and the user service status through a working console, then repeat normal-user graphical acceptance before replacing the public ISO.

## Published preview — earlier image

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
