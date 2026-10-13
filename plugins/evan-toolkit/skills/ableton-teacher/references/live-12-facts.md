# Live 12 facts, versions and sources

Contents: Evan's install · what changed in 12.x · names that changed · stem separation requirements · manual pages to open · known video-vs-manual differences.

## Evan's install

Ableton Live 12 Suite 12.4.6 (build 2026-09-10) on macOS, in /Applications/Ableton Live 12 Suite.app. Suite means every stock device and stem separation are available. Checked on 24/09/2026.

## What changed in 12.x that matters for DJ work

| Version | Date | What matters |
| --- | --- | --- |
| 12.0 | March 2024 | New Browser with tags and filters and similar-sound search; Scale/Key awareness (Control Bar Scale box, Highlight Scale in MIDI clips); MIDI Tools (Transform and Generate); mixer strips inside Arrangement View (bottom-right icon); the H and W fit buttons; Roar saturator; new themes |
| 12.3 | 25 Nov 2025 | Stem Separation (Suite) with High Speed and High Quality modes; Splice panel in the Browser with Search with Sound; Auto Pan-Tremolo redesign with a Tremolo mode; Bounce Group to New Track, Bounce Group in Place, Paste Bounced Audio; device A/B compare (P); insert MIDI clips at the insert marker in Arrangement |
| 12.4 | 5 May 2026 | Link Audio; Erosion redesign (Noise Blend, 2 ms latency); Chorus-Ensemble and Delay LFO changes; Separate Stems for Time Selection and Merge to Single Track; Learn View replaces Help View (⌘⌥7); Quick Tags improvements; GPU stem separation on macOS 26.4+ |

## Names that changed (older videos use the old ones)

| Old | Now |
| --- | --- |
| Preferences | Settings (⌘,), same tabs |
| Help View | Learn View (⌘⌥7) |
| Master track | Main track |
| "Complex Pro" shown as "Pro" in some builds' menus | Complex Pro |
| Settings tab "Link, Tempo & MIDI" | Two tabs in 12.4.6: "Link" and "Tempo & MIDI" (Control Surface slots live in Tempo & MIDI; confirmed on Evan's screen 24/09/2026) |

## Stem separation requirements

Suite edition; Live 12.3 or later; 8 GB RAM minimum, 16 GB recommended for High Quality; runs locally (no upload). Output stems land in <Project>/Samples/Processed/Stems/.

## AbletonMCP (installed 24/09/2026)

The third-party AbletonMCP server (ahujasid/ableton-mcp) is registered in Claude Code and Claude Desktop, with its Remote Script in ~/Music/Ableton/User Library/Remote Scripts/AbletonMCP/. In Live it must be selected under Settings → Link, Tempo & MIDI → Control Surface (Input and Output: None). When its tools (mcp__AbletonMCP__*) are present in a session, use them to read Evan's set (tempo, tracks, clips) and to check his lesson evidence directly instead of asking for screenshots. Ask before changing anything in his set, and remind him to save first. Run it from one app at a time.

## Manual pages to open when the references don't answer

- Keyboard shortcuts (Mac): https://www.ableton.com/en/live-manual/12/live-keyboard-shortcuts/
- Audio clips, tempo and warping: https://www.ableton.com/en/live-manual/12/audio-clips-tempo-and-warping/
- Arrangement View: https://www.ableton.com/en/live-manual/12/arrangement-view/
- Stem separation: https://www.ableton.com/en/live-manual/12/stem-separation/
- Mixing (crossfader, cueing, sends): https://www.ableton.com/en/live-manual/12/mixing/
- Managing files and sets (export, Collect All and Save): https://www.ableton.com/en/live-manual/12/managing-files-and-sets/
- Audio effect reference (every stock device): https://www.ableton.com/en/live-manual/12/live-audio-effect-reference/
- Release notes (what each 12.x added): https://www.ableton.com/en/release-notes/live-12/

Fetch the page and quote the control names as written there. If a page is unreachable, say the fact is unverified.

## Known video-vs-manual differences

| Claim seen in a video or web page | What is true in 12.4 |
| --- | --- |
| "Preferences" | Settings; same options |
| Help View | Learn View since 12.4 |
| Erosion with Noise / Wide Noise / Sine and 5 ms latency | Redesigned in 12.4 with Noise Blend and about 2 ms latency |
| Turn Auto-Warp Long Samples off (production tutorials) | Either setting is fine for DJ work; the metronome check is what matters. On saves time with steady-tempo songs |
| Turn Create Analysis Files off | Keep it on; .asd files store warp markers so a song stays warped in every set |
| Limiter ceiling "0 dB" (said) | The screen showed −0.30 dB; a little below 0 is the safer choice |
| "Three track types: audio, MIDI, return" | Also group tracks and the Main track |
| ⌘⌥F shows the crossfader (web page) | ⌘⌥F is Create Fade/Crossfade in Arrangement; the crossfader is shown via View → Mixer Controls, no shortcut |
| Shifter is "Live 12's pitch shifter" | Shifter exists since 11.3; it is the stock pitch-shift device |
| Roar proves a video is 12.1+ | Roar shipped with 12.0; use Splice in the Browser (12.3+) or Learn View (12.4) as version markers |

## Studied so far

- Live 12 manual chapters: Live concepts, Arrangement View, Audio clips/tempo/warping, Stem separation, Mixing, Managing files and sets, Keyboard shortcuts; the 12.3 and 12.4 release notes.
- Videos (see study-log.md for timestamps and what was on screen): Ethan Davis beginner guide (Live 12.0, 2024); SYNTHO beginner guide (12.3, 2026); Sequence One warping (May 2026); PML warping full tracks and vocals (2024); pointblank stem separation (Dec 2025); PML five stem-separation uses (Feb 2026); STRANJAH DnB DJ edit in 12.3 (Oct 2025); Distinct Mastering DJ mix template (Nov 2025); ZW Buckley transitions with automation (Apr 2026); two wordplay concept videos (DJ software, transcripts only).
- Not yet studied: synth design, Max for Live, Push, MPE, recording instruments, Follow Actions.
