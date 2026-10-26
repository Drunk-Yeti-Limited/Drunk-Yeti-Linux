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
