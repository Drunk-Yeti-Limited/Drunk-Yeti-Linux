# Rebuilt PlaySpace ISO screenshots — October 27, 2026

These are actual QEMU BIOS VM captures from ISO build `40430362637`, source `f7622b2443fa2fef10fbf494191ad6c75012de29`. Original PPM captures were converted losslessly to PNG without cropping or retouching.

| Image | Original | Observation |
| --- | --- | --- |
| [PlaySpace desktop](playspace-desktop-600s.png) | `600s.ppm` | PlaySpace and Yeti welcome interface visible ten minutes after Enter |
| [Boot menu](playspace-boot-menu.png) | `boot-menu.ppm` | Debian 13 BIOS live menu; stock artwork still present |

Normal boot artifact: `12702889016`, from [build/boot run 40430362637](https://github.com/Drunk-Yeti-Limited/DrunkYetiPlaySpace-Source/actions/runs/40430362637). Downloaded ZIP SHA-256 matched GitHub's published digest:

```text
f2fe182e60224c6dd90fe679159b10e2052ae4eb70fee36afe932b7047dbf035
```

VM: Q35/BIOS, 4 GB RAM, 2 vCPUs, standard VGA, no network; KVM when available, otherwise CPU emulation. The harness presses Enter at the boot menu and observes startup. The 300-second image is blank; the 600-second image visibly contains PlaySpace. The boot recording is sampled approximately every two seconds, with no audio; it is not a complete feature tour.

The separate session-verification run `40432406032` completed successfully and produced artifact `12702668547`. That artifact is separate from the normal boot screenshots published here.

The [public PlaySpace preview download](https://github.com/Drunk-Yeti-Limited/Drunk-Yeti-Linux/releases/tag/playspace-preview-2026-10-27) now contains this tested image. The older KDE preview remains under its original tag. No UEFI, Secure Boot, physical-hardware or full app acceptance is implied by these images.

---

## Historical captures — superseded for the rebuilt image

# Boot screenshot provenance — October 26, 2026

The candidate captures are unedited QEMU screendumps from the rebuilt live ISO. Original PPM images are converted losslessly to PNG for GitHub.

- ISO build run: `40387571504`; source commit: `c94989fcc2984516338f66048875418006663ca7`.
- Boot-only inspection run: `40393334355`; harness commit: `1e5bc7aa3a9864d062d250e15472e688ed192afa`.
- VM: Q35, BIOS, 4 GB RAM, 2 vCPUs, standard VGA, network disconnected; KVM when accessible, otherwise Nehalem CPU emulation.
- Boot-menu capture: 15 seconds after QEMU launch, then Enter is sent.
- Desktop captures: 60, 120, 180, 300 and 600 seconds after Enter.
- Startup-log capture: after 600 seconds, the harness opens Konsole and types `tail -30 ~/.local/state/DrunkYetiPlaySpace/startup.log`.
- The harness does not manually launch Yeti. A visible Yeti shell would therefore be evidence of autostart for this specific VM test.
- ISO downloads in the main README still refer to the earlier public preview, not this candidate.
- The first chained boot job timed out during package download before QEMU started. It supplied no screenshot evidence.

The older `boot-menu.png` and `kde-desktop.png` belong to the original public release: ISO source `f06555ca6613db653b36d195c6c1f5e2608e6a81`, build run `40374303793`, boot run `40379229619`, artifact `12678283075`.

## Observed result

Artifact `12686781195` was downloaded and its ZIP SHA256 verified as `ed1e1ef0ab5c72ede92ba4d88367d2c222bed7558a2e2a0692a79d45d2b80b0c`.

| PNG | Original capture | What is visible |
| --- | --- | --- |
| [Candidate boot menu](candidate-boot-menu.png) | boot-menu.ppm | Debian 13 live menu |
| [Linux startup](candidate-linux-startup.png) | 180s.ppm | live-config completed; SDDM started |
| [300 seconds](candidate-black-screen-300s.png) | 300s.ppm | Black screen with pointer |
| [600 seconds](candidate-black-screen-600s.png) | 600s.ppm | Black screen |

The startup-log capture is also black and supplies no readable diagnostic log. Neither KDE nor Yeti is visible in the final captures. The workflow passed at collecting screenshots; graphical-desktop acceptance did not pass. The images do not establish the root cause.
