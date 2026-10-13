# Recipes for Evan's five goals

Contents: 0 shared pipeline · 1 mashup · 2 transitions toolbox · 3 wordplay edit · 4 bootleg · 5 DJ mix · 6 finishing (loudness, export, saving).

All in Arrangement View unless stated. Mac shortcuts. Sources: study-log.md V4–V10, the Live 12 manual (Arrangement View, Mixing, Managing Files and Sets).

## 0 Shared pipeline

Set the tempo → import the songs → warp each one (warping.md) → separate stems if needed (stems-and-keys.md) → match keys → arrange (split, duplicate, fade) → mix (EQ, sends, automation) → loudness → export → Collect All and Save.

## 1 Mashup: acapella over instrumental

1. Type the instrumental's BPM into the tempo box.
2. Drag both songs into Arrangement on separate tracks, starting at bar 1. Warp both (warping.md), Complex Pro.
3. Right-click the vocal song → Separate Stems to New Audio Tracks → High Quality. Keep Vocals; select the other stems and press 0.
4. If the instrumental song has its own vocal, separate it too and deactivate its Vocals.
5. Match the key (stems-and-keys.md): Transpose on the vocal clip, Formants 100, within ±3 semitones.
6. Line up phrases: the vocal's first line should start on bar 1 of an 8- or 16-bar phrase of the instrumental. Split verses and choruses with ⌘E so each can sit where it fits.
7. Fill gaps with ⌘D (duplicate) and audition with ⌘L (loop the selection).
8. Vocal chain: EQ Eight with a high-pass around 100–150 Hz; Compressor, gentle; Send A to a Reverb return; Send B to an Echo or Delay return for throws.
9. Instrumental: lower it 2–3 dB, or dip 1–4 kHz slightly in EQ Eight if it fights the vocal.
10. Fades on every clip edge (F shows the handles; ⌘⌥F creates fades on the selection).
11. Press A and automate the vocal volume or the Echo send at phrase ends.
12. Finish (section 6).

## 2 Transitions toolbox

| Move | Device or control | How | Best for |
| --- | --- | --- | --- |
| Bass swap | EQ Three → GainLo, or the L kill button | Press A; add an EQ Three → GainLo lane on both tracks; drop the outgoing lows at the same bar the incoming lows come up | Blends between two full songs |
| Filter sweep | Auto Filter → Frequency (and Resonance) | High-pass rising over 8–16 bars on the outgoing track; open back on the downbeat. Presets: DJ Filter Soft Clip, Highpass Slide Away | Getting out of a section |
| Echo throw | Echo or Delay on a return; the track's send knob | Automate the send up on the last word or hit, then cut the source; the tail carries over | Vocal endings, wordplay switches |
| Delay freeze | Delay device: the ∞ button beside Feedback | Switch it on for one beat before the drop, off on the drop | Stutter into a drop |
| Reverb tail | Hybrid Reverb on a return | Send up on the last bar; ⌘I inserts a bar of silence so the tail can ring | Breakdowns |
| Reverse hit | Copy the last snare or word (⌘D), then R (Reverse Clip) | Place it so it ends exactly on the downbeat; three copies before a drop works well | Fills |
| Gated stutter | Auto Pan-Tremolo → Tremolo tab, Synced 1/16 to 1/32 | On for the last four bars before a drop | Tension |
| Beat Repeat | Beat Repeat device | Enable on the last bar; Grid from 1/8 down to 1/32 | Rolls into a drop |
| The drop-out | Track mute (Speaker On) automation, or 0 on that bar's clips | Mute bass and drums for the bar before the drop; grid off so it ends a hair early | Contrast before a drop |
| Tempo ramp | Main track automation → Mixer → Song Tempo | Draw a slope across a whole song, for example 126 → 130 | Mixes that change speed |
| Slowdown | Re-Pitch warp mode, then Shift-drag the last beat's clip edge | Pitch drops with speed, like a record stopping | Hard cuts, wordplay switches |

Rules that make transitions work:
- One automation lane per parameter. The + on a lane header adds lanes; keep them all visible.
- Group the instrumental tracks (⌘G) so an effect on the group hits the beat but not the acapella.
- Put transitions on phrase boundaries (8 or 16 bars), and land the drop on bar 1 of a phrase.
- Option-drag a straight automation line to curve it.
- Grouping a whole edit under one group and putting the effects there lets one knob hit everything.

## 3 Wordplay edit

A wordplay switch lands song B on a lyric that answers or continues a lyric in song A. It works when someone who isn't a DJ gets it straight away, so obvious links beat clever ones.

1. Keep a list of lyric links as you hear them.
2. Warp both songs into one set at one tempo, or use a Song Tempo ramp between them.
3. Separate stems on both. For A keep Vocals and the instrumental stems; for B keep everything.
4. Mark the cue points with locators: play to A's line, press Set in the scrub area, ⌘R to rename it "A out"; same for B's matching line, "B in".
5. Split A at the end of its word (⌘E) and deactivate what follows (0). Turn snapping off (⌘4) if the word doesn't sit on the grid.
6. Under A's last line, loop two bars of B's instrumental stem (select two bars, ⌘D to repeat), so the groove is already B's when the word lands.
7. Slide B's vocal so its word starts on the beat where A's word ends. Fade both edges.
8. Echo throw on A's last word (send automation) to glue the join.
9. Word-level rearranging: stems-and-keys.md, "Chopping a vocal into words".

## 4 Bootleg

Keep what people recognise (the vocal, the hook) and replace the groove.

1. Type the song's BPM from Beatport or Rekordbox. Import, warp, Complex Pro.
2. Separate Stems, High Quality: Vocals, Drums, Bass, Others.
3. Split every stem at the section boundaries (intro, breakdown, drop) with ⌘E, and colour the sections (right-click a clip → colour swatch) so the structure is visible.
4. In the drop, select the original Drums and Bass clips and press 0. Keep Vocals and Others.
5. New drums on new tracks: a drum break in Beats mode, chopped with ⌘E and rearranged; or one-shots pulled from the original's Drums stem (stems-and-keys.md).
6. New bass following the original's root notes; the Others stem shows the chords. Utility → Bass Mono keeps the sub centred.
7. Fills at phrase ends: reverse snares (R), the drop-out, a Beat Repeat bar.
8. Structure: 8 + 8 bars with a variation in the second 8, then a 16-bar roll-out.
9. Loudness: the original is probably very loud, so match it (section 6).
10. Export (section 6). Keep it for your own sets unless you have permission to release it.

## 5 DJ mix: two decks in Arrangement

Build this once and save it with File → Save Live Set As Template…:

| Track | Devices | Audio To |
| --- | --- | --- |
| DECK A (audio) | EQ Three → Utility | MASTER OUT |
| DECK B (audio) | EQ Three → Utility | MASTER OUT |
| MASTER OUT (audio track, Monitor In) | Audio Effect Rack with macros: Cut Highs, Cut Lows, Space (Hybrid Reverb), Sweep (Auto Filter), Delay Wet, Delay Time, Delay Feedback | Main |
| Main | Limiter (Ceiling −0.3 dB, True Peak) | – |

Deck faders around −9 dB for headroom; make it up on the Limiter. Live runs at 32-bit float, so a track meter in the red isn't damage, but the Main should never clip.

Workflow:
1. Songs alternate DECK A, DECK B, A, B. Warp each (warping.md) and put its first downbeat on a bar line.
2. Overlap the incoming song over the outgoing song's last 16–32 bars, phrase-aligned (count in 8s).
3. Press A. On both decks add an EQ Three → GainLo lane. Bass swap: incoming lows cut until the swap bar, outgoing lows cut from that bar on.
4. Fades on clip edges for smooth blends, or a hard cut on a downbeat.
5. Clip gain (Audio box → Gain) to level-match a quieter song.
6. Song Tempo automation on the Main track to move between BPMs across a song.
7. MASTER OUT macros for sweeps and throws at transitions; MIDI Map (⌘M) them to a controller for hands-on control.
8. Loop a section (⌘L, or ⌘D to repeat it) to stretch an intro or outro when phrases don't line up.
9. Finish (section 6) and export the Main as one file.

For a live performance instead of a recorded mix: Session View with clips on two tracks, the A/B crossfader (View → Mixer Controls to show it; A and B buttons on each track), and Cue Out set to a second output for headphone cueing.

## 6 Finishing: loudness, export, saving

Loudness. Live has no LUFS meter. For DJ edits aim to match the original: switch between edit and original at the same fader level, and compare the low end on Spectrum. A stock Main chain: Glue Compressor (light, 2:1) → Saturator with Soft Clip on, or Limiter (Ceiling −0.3 dB, True Peak mode) → Utility for the last dB if needed. The Main meter stays out of the red.

Export (⌘⇧R): Rendered Track = Main; Render Start and Render Length = the loop brace or the whole set; Sample Rate 44100; PCM on, WAV, 24-bit (dither only when rendering 16-bit); Normalize off; Render as Loop off; Encode MP3 ticked for a sharing copy; Create Analysis File on. Stems: Rendered Track = All Individual Tracks, and Include Return and Main Effects if the sends should be printed.

Saving. File → Collect All and Save (answer Yes to all) copies every sample into the project folder, including stems. File → Save Live Set As Template… stores the mix template under User Library → Templates. File → Save Live Set As Default Set makes a set open every new project with that layout.
