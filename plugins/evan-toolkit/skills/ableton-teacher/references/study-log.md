# Ableton Live 12 knowledge log

Evan's goal: mashups, transitions, wordplay edits, bootlegs, DJ mixes. His install: Live 12 Suite 12.4.6 (macOS).
Sources studied so far: official Live 12 manual (interface, warping, arrangement, export, stems, shortcuts, 12.3/12.4 release notes); Ethan Davis beginner guide (Live 12.0, 2024); SYNTHO beginner guide (Live 12.3, 2026).

---

## V3 — Sequence One, "Ableton Live 12 Warping: The Only Guide You Need" (KChOk9gNMSw, 07/05/2026, 15:33)

Material: a spoken "1 2 3 4" recording in Arrangement (not a full song).

### Seen on screen, 0:38–7:44
- **Live 12 clip panel is sectioned**: collapsible `Clip`, `Audio`, `Transform` boxes (left of the Sample editor). Audio box contents: **Warp** button + **Follow** button (the Leader/Follower toggle), warp-mode menu (Beats), **Preserve** (Transients), transient loop mode menu + envelope (100), **BPM** field with `/2` `×2`, **Gain** fader (24 to −70, 0.0 dB), **Pitch** knob (st) with semitone/cent fields, **Reverse**, **Edit**, **RAM**, **HiQ**.
- Sample editor header shows file name, sample rate, bit depth, channels (e.g. 48.0 kHz 24-Bit 1 Ch). Tabs: Sample | Envelopes.
- Warp markers = yellow tabs in the strip above the waveform. Grey arrow ticks = transients / pseudo warp markers. Double-click in that strip to add a marker. Drag a marker to stretch/compress audio either side (like pins on a rubber band); markers each side act as anchors.
- **Right-click warp-marker/sample-editor menu (Live 12, full list seen):** Delete (Del) · Delete Transient(s) (⇧⌘Del) · Zoom To Fit (Z) · Zoom Back from Clip Selection (X) · Fit Content To View Width (W) · Fit Content To View Height (H) · Quantize (⌘U) · Quantize Settings… (⇧⌘U) · Extract Groove(s) · Activate Loop (⌘L) · **Slice to New MIDI Track** · **Convert Harmony / Melody / Drums to New MIDI Track** · Normalize Clip Sample · **Crop Clip Sample (⇧⌘J)** · **Split Clip (⇧⌘E)** · Manage Sample File · Show in Browser · Show in Finder · Show Similar Files · **Set 1.1.1 Here** · **Warp From Here** · **Warp From Here (Start at 120.00 BPM)** · **Warp From Here (Straight)** · **Warp 120.00 BPM From Here** · **Warp Sample as 4-Bar Loop** · Snap to Grid (⌘4) · Adaptive Grid (Widest/Wide/Medium…).
- **Set 1.1.1 Here** on a warp marker makes that point bar 1 (fixes silence at a file's start — key for lining up a song's first downbeat). Undo ⌘Z / redo ⇧⌘Z.
- Select a range in the Sample editor + **⌘L** = clip loop around it (caption "CMD+L[MAC]"). ⌘L in Arrangement = arrangement loop.
- The **BPM field updates live** as you drag markers (120 → 104.14 → 99.43): it reports the tempo implied by the markers.
- Turning Warp off then on again raises a dialog: "Would you like to keep the current timing of the clip(s)? Yes = keep current timing / No = revert to the previous set of warp markers / Cancel".
- Warp off + Pitch knob = speed and pitch change together (tape/turntable). Warp on + Pitch = pitch changes, timing stays. Double-click the knob resets to 0.
- Status bar shows clip start/end/length and the full file path when a clip is selected.
- Arrangement view extras seen: H and W buttons and a zoom readout (1.00x) at bottom right; the mixer section (A Reverb, B Delay, Main with volume boxes, S, Post) sits at the right of the arrangement.

### 7:44–15:33 (frames checked)
- Six modes: Beats (drums/transients), Tones (monophonic), Texture (noise/non-tonal), Re-Pitch (only mode where tempo changes pitch; the Pitch dial disappears), Complex, **Complex Pro — his pick 90% of the time for vocals, chords, whole songs**. He switches between Complex Pro and Beats.
- Artifacts demo at 20 BPM to hear each mode's character.
- Short samples come in unwarped by default; turn Warp on manually.
- **Shift-drag a clip's edge in Arrangement = stretch the audio in time** (bracket icon appears). ⌘J consolidate then keep stretching for bigger effects.
- Creative: add warp markers inside a phrase and drag them to create stutters/stretches; try Tones/Texture for different textures.
- Shift-drag the audio under a marker to slide the waveform without moving the marker. Select a range of markers and delete to remove them.
- Frame-confirmed: warp-mode menu order Beats · Tones · Texture · Re-Pitch · Complex · Complex Pro. **Tones** shows a Grain Size field (36.75 default seen). **Re-Pitch** hides Preserve and grays the Pitch knob.
- Library one-shots (E-Perc Analog Low, 96 kHz) arrive with Warp **on** in this set, Beats mode, BPM 120. (He says short samples come in unwarped by default; that depends on the "Loop/Warp Short Samples" setting.)
- **Shift + drag clip edge** → on-screen caption "Shift — Stretch Warped Clip"; a `]⇔` cursor appears and the audio stretches (BPM readout climbs, e.g. 100 → 378 / 306).
- **Shift + click-drag on waveform** → caption "Move Audio Around Warp Marker — Shift+Click Drag Left/Right".
- Status bar with a library clip shows its path: /Applications/Ableton Live 12 Suite.app/Contents/App-Resources/Core Library/Samples/Loops/Drums/Full/…
- Browser in his build: a Filters panel with **Auto Tags** toggle and **Edit** button, Type (Loop / One Shot), Drums, Character, Genres. (Auto Tags = Live 12's automatic sample tagging.)
- Unclear on screen: the exact keypress he used to delete a highlighted range of markers (he says "highlight and…" and the video ends). The manual says Delete.

**Mashup relevance:** Set 1.1.1 Here + Warp From Here (Straight) is the fast path for a full song with a steady tempo; Complex Pro for full songs and acapellas; Shift-drag the waveform to nudge a downbeat under a marker; Shift-stretch clips for creative slowdowns in transitions; "Warp Sample as 4-Bar Loop" for loops.

---

## V4 — pointblank music school, "Stem Separation in Ableton Live 12.3" (i3gPlxPVvh4, 11/12/2025, 11:15)

Material: a full commercial-style track in Arrangement at 125 BPM, then stems chopped into Simpler over a house loop.

### Steps as seen on screen
1. Arrangement, the full song clip on one audio track. **Ctrl-click (right-click) the clip → Separate Stems to New Audio Tracks.**
2. **Separate Stems dialog**: four rows with tick boxes and coloured icons: **Vocals, Drums, Bass, Others**; a **High Speed ⟷ High Quality** switch; the note **"This action will stop audio."**; buttons **Separate / Cancel**. (In 12.4 there's also a Merge to Single Track tick box, per the release notes; not in his 12.3 build.)
3. Result: a new **group track** named after the song, containing four audio tracks "Vocals <song>", "Drums <song>", "Bass <song>", "Others <song>", with clips lined up exactly with the original. He found some of the bass's top end in "Others".
4. Stem files are written to **<Project>/Samples/Processed/Stems/<song> [date time] (Vocals).wav** (16-bit 44.1 kHz; seen in the status bar). Collect All and Save matters here.
5. He deletes the Drums and Others stems he doesn't need.

### Stems into Simpler Slice mode (the core technique for wordplay edits)
- Drag the stem clip from Arrangement onto an empty **Simpler** ("Drop Sample Here"). Simpler's mode buttons sit down the left side: **Classic / 1-Shot / Slice**.
- **Slice** mode controls: **Trigger / Gate**, **Slice By** (Transient; other options seen in the manual: Beat, Region, Manual), **Sensitivity** (100% = many short slices; he lowered it to 33–35% so each slice holds a whole word/phrase), **Playback** (Mono / Poly), plus **Warp** (Beats mode), "as 84 Bars", ÷2 ×2, **Fade In / Fade Out**, **Transp**, **Vol<Vel**, **Volume**. Slice markers show as vertical lines on the waveform, and you can drag them to trim.
- Each slice maps to a MIDI note from C1 upward. He plays slices from the keyboard with the track armed, records, then **⌘A + ⌘U** (select all + quantize) and sets velocities, then **Transp +7 st** to fit the key.
- He adds short **Fade In/Out** on slices to remove clicks.
- Effects chains used: bass chop → Delay (stereo width), **Roar** (distortion), Utility (gain). Vocal chop → **Echo**, **Shifter** (Live 12's pitch shifter, −5 st, Pitch mode), **Auto Pan-Tremolo**, **Auto Filter** (remove lows).
- Live 12.1+ MIDI clip panel seen: sections **Clip · Launch · Pitch & Time · Transform · Generate**; "Highlight Scale" tick; MIDI tools (Fit to Scale, Invert, Add Interval, Stretch, ×2 ÷2, Set Length, Humanize, Reverse, Legato).

**Relevance:** acapella extraction for mashups and bootlegs (Vocals stem); instrumental beds (keep Drums+Bass+Others, mute Vocals); **wordplay edits = vocal stem → Simpler Slice → trigger words from MIDI in a new order.** For whole-phrase edits in Arrangement, splitting the audio clip (⌘E) and moving clips is the alternative to Simpler.

---

## V5 — STRANJAH, "Remixing Beatport's #1 DnB Track in Ableton Live 12.3 (DJ Edit Tutorial)" (BKhiq5L3U24, 06/10/2025, 17:51)

Material: Sub Focus "Original Don" (174 BPM, F minor) turned into a jungle DJ edit/bootleg. Windows build (Ctrl shortcuts). He relies heavily on third-party plugins (Serum 2, FabFilter Pro-C 2, StandardCLIP, Ozone, SPAN, Youlean) and his own sample packs; I've skipped the product promotion and kept the workflow.

### Bootleg/DJ-edit workflow (confirmed on screen)
1. **Type the track's known BPM into the tempo field before importing** (Beatport gives BPM + key). The FLAC arrives in **Complex** warp mode with BPM 120 shown until it's analysed. Setting the tempo first means auto-warp lines up faster.
2. **Right-click the Arrangement audio clip → full Live 12.3 menu (Windows shortcuts):** Cut/Copy/Duplicate/Delete · Zoom to Time Selection (Z) / Zoom Back (X) · Rename (Ctrl+R) · Edit Info Text · Extract Groove(s) · **Deactivate Clip (0)** · **Consolidate (Ctrl+J)** · **Consolidate Time to New Scene** · Show in Browser/Explorer · Create Fade (Ctrl+Alt+F) · Reset Fades · Loop Selection (Ctrl+L) · Freeze Track · **Bounce Track in Place** · **Bounce to New Track (Ctrl+B)** · Paste Bounced Audio · **Crop Clip (Ctrl+Shift+J)** · **Reverse Clip(s) (R)** · Convert Harmony/Melody/Drums to New MIDI Track · **Separate Stems to New Audio Tracks** · clip colour grid · Copy Max for Live Path. (Mac equivalents: Ctrl→⌘, Alt→⌥.)
3. Separate stems at **High Quality** → Vocals / Drums / Bass / Others lanes. He admits artifacts are audible in the vocal, but says they're fine once other sounds sit on top.
4. **Colour-code sections**: he split the stem clips at phrase boundaries (⌘E) and coloured intro/breakdown aqua and drops purple, so the song structure is visible at a glance. Split points line up across all four stems.
5. **Deactivate the original Drums and Bass stems in the drop** (select the clips → 0; they grey out) and program new drums and bass on new tracks. Keep Vocals + Others. That's the essence of a bootleg: keep the recognisable elements, replace the groove.
6. Breaks as audio clips: cut them into pieces with ⌘E and rearrange them to make new patterns (double kick then dotted-quarter snares). Duplicate with Alt/⌥-drag.
7. **Reverse-snare fill:** split off the last snare, **reverse it (R / Reverse Clip(s))**, make 3 copies leading into the drop, trim so the reverse starts a bit earlier ("they sound better if they start earlier"), pitch the reversed samples +6 st so they sit in key.
8. "Be faithful to the original": follow its chords and bassline (sub following the original synth notes) so the edit sounds cohesive.
9. Structure: 8 bars A + B, next 8 bars copy-paste with a new fill at the end of the phrase, then a 16-bar roll-out (B section looped, main bass removed).
10. **Splice panel (12.3)** in the Browser: Home/Library/Settings, Search Splice, Instruments/Genres/Cinematic FX. **Search with Sound**: drag an Arrangement time selection or clip onto it → Live runs "Export Audio…" (progress dialog) → Splice suggests samples matched to key and BPM. The preview player shows key (E+2) and BPM (1×).
11. **Loudness matching for DJ edits:** stems with parts muted lose loudness, so match the original. He measured the original at about −2.5 LUFS short-term (very loud DnB) with a loudness meter, used a gentle compressor → clipper → limiter/maximiser, and a **Utility +1.5 dB** at the end. He compared bass level to the original on a spectrum analyser (about −34 dB at the low end). Stock alternatives in Live: Glue Compressor/Compressor, **Saturator soft clip**, **Limiter**, **Spectrum**, Utility; Live 12 has no stock LUFS meter.
12. **Auto Pan-Tremolo (12.3 redesign):** Panning | Tremolo tabs; Synced rate 1/16, Shape −78%, Amount 100%, phase 228°, Att | Mod. He used Tremolo mode on the synth stem for the last 4 bars before the drop as a gated tension build.
13. He changed the tempo throughout his personal edit so a rip wouldn't beat-match cleanly (an anti-leak trick, not a technique to copy for club use).

**Relevance to Evan:** this is the bootleg template: tempo → import → stems → split and colour by section → mute the original drums/bass in the drop → new drums/bass or a different track's instrumental → fills (reverse snares) → loudness-match the original → export.

---

## V6 — Distinct Mastering (Freddy), "How To Make DJ Mixes In Ableton Fast!" (ezqyKyPud0A, 05/11/2025, 12:13)

Material: his DJ-mix template (Live 12, Mac), used for a real 4-hour mix plus a two-track demo. Everything is stock except one optional free Max for Live noise device inside his paid DJ FX rack.

### Template layout (seen on screen)
- **Two deck tracks, TRACK 1 and TRACK 2**, with songs alternating between them in Arrangement (A/B like two decks), plus an optional **Voice Over** track and returns (Vox Verb, Vox Delays).
- Each deck: **EQ Three** (GainLow / GainMid / GainHi knobs with L/M/H kill buttons, FreqLow 300 Hz, FreqHi 3.0 kHz, 24/48 slope) → **Utility** (Gain). Old version used EQ Eight with a high-pass. **EQ Three is the one that behaves like a DJ mixer.**
- Deck outputs are routed ("Audio To") to a **MASTER OUT audio track** (Monitor In) that holds the DJ FX rack, then to Main. Main has a **Limiter**.
- **Headroom:** deck faders around −9 dB so the MASTER OUT doesn't clip; make it up at the end with the **Limiter** (Live 12 Limiter controls seen: Input Gain, Maximize, Ceiling, Release/Auto, Lookahead, Mode Standard/**Soft Clip**/**True Peak**, Link, Routing L/R M/S). Live runs at 32-bit float, so internal red isn't fatal, but gain-stage anyway.
- He saves it as a template: User Library → Templates → "DJ Mixes – DJ FX.als" (Browser shows a Templates folder; `File → Save Live Set As Template…`).

### Mixing workflow
1. Line each track up on the grid: clip start at 1.1 (Set 1.1.1 Here), then check with the metronome at the start and end. Warp on (Beats mode shown; BPM 132 and 128 files).
2. Overlap the incoming track near the outgoing track's end, phrase-aligned (count in 8s). He counts "1…8" to land the drop.
3. **Press A** to show automation lanes. Track 2's lane is set to **EQ Three → GainLo**. **Bass swap**: draw the low-cut as a stepped envelope, keeping incoming lows cut until the swap point, and cut the outgoing lows at the same moment, so there are never two basslines together.
4. Automation editing: **double-click** on a lane adds a breakpoint. The Info View shows breakpoint help: Shift = fine-tune vertical, ⌘ = toggle grid, ⌘⌥ drag = scroll display, Option-drag near a line = create curve. Selecting a time range and dragging a line moves the whole region.
5. **Clip fades** in Arrangement (handles at the clip's top corners) for smoother blends in and out, or hard-cut instead.
6. **Clip gain** (Gain in the clip's Audio panel) to level-match a quieter track.
7. Loop a section to extend an intro or outro: select, split, loop, move.
8. **Tempo automation for mixes:** in the Main track's automation chooser pick **Mixer → Song Tempo** (range fields 60–200 seen) and draw a gradual ramp, e.g. 126 → 130, across a song. Expect mild warp artifacts.
9. DJ FX rack on MASTER OUT (Audio Effect Rack macros): Cut Highs, Cut Lows, Space (reverb with tails), Sweep Up/Down (noise), Flange, Crush, Delay Wet/Time/Feedback, all automatable and MIDI-mappable (⌘M). The stock building blocks are EQ/Auto Filter, Hybrid Reverb, Delay/Echo, Chorus-Ensemble/Phaser-Flanger, Redux.
10. Info View (bottom left) stayed open throughout; it shows context help for whatever is hovered (clip, envelope, grid). Grid shortcuts in Info: ⌘1 narrow, ⌘2 widen, ⌘3 triplet, ⌘4 show/hide grid, ⌘5 fixed/adaptive.

**Relevance:** this is the DJ-mix build Evan needs: A/B deck tracks with EQ Three + Utility, bass swaps via GainLo automation, fades, tempo automation on Main, a master FX bus, and a limiter at the end.

---

## V7 — ZW Buckley (Ableton Certified Trainer), "Automation is the key to AWESOME transitions in Ableton Live" (5RFcyMC9aUM, 17/04/2026, 16:23)

Material: his own song at 138 BPM C minor, already arranged in Arrangement with locators V1 / C1 / V2 / C2 / Outro 2. He uses his own single-knob performance-FX racks (Freeze Delay, Vaporwaver, Reverse, IsoVerb, Tremolo, Lofi, DJ Looper, Crusher, Vinyl Sim), built in a separate video. The Ableton techniques carry over.

### Techniques (confirmed on screen)
- **Nested group buses for FX:** select all tracks → ⌘G → rename "PFX" (performance FX); inside it, group the instruments again as "Instruments" (not vocals). An FX on the Instruments group hits everything except vocals; an FX on PFX hits the whole mix. The group chain view shows each rack's name.
- **Locators** in the scrub area (▷ V1, C1, V2, C2, Outro 2) label song sections.
- **Automation lanes per device parameter:** a lane's chooser is two dropdowns, device (e.g. "ZW Freeze Delay PFX", "Auto Filter", "Mixer") then parameter ("Delay / Freeze", "Frequency", "Resonance", "Track Panning", "Speaker On"). The **+ / −** buttons on a lane header add or remove extra lanes. He strongly recommends **one lane per effect** so you can see everything at once. He sometimes deletes lanes by accident; the fix is undo.
- **Automation shapes seen:** steps (instant on/off for Speaker On, i.e. track mute automation), curved ramps into a downbeat (Option-drag for curves), short spikes (a one-beat freeze hit right before the section). Value readouts appear while drawing (e.g. "0", "10 %", "On").
- **Transition recipes he used:**
  1. **Delay freeze hit** on the last beat before a verse (freeze-delay rack spike).
  2. **Reverse on the Instruments group** leading into the chorus, so vocals stay dry.
  3. **Reverb ramp (IsoVerb) → insert one bar of space** (Insert Silence ⌘I in Arrangement) to let the tail ring, then a delay freeze to carry the sound through the gap.
  4. **Dip the drums for the last bar** to remove clicks and build space.
  5. **Tremolo (Auto Pan-Tremolo, Tremolo mode, Synced 1/32–1/64)** on PFX for a stutter-gate "bada-bada" build.
  6. **Auto Filter**: Frequency and Resonance automation (Resonance ramp to 10%; Frequency opening back up on the downbeat). Browser shows many Auto Filter presets: "DJ Filter Soft Clip", "Cut-O-Move HPF/LPF", "Highpass Slide Away", "Lowpass".
  7. **"Stone-cold classic": mute (Speaker On automation) bass and drums for the bar before the drop**, with the grid off, ending a hair before the downbeat so no click catches — contrast makes the drop hit.
  8. **Beat Repeat / DJ looper** on the outro with filter-width automation.
- **Auto Filter (Live 12)**: Freq, Res, Drive, SVF filter type, 12/24 dB, LFO Amt/Rate/Wave/Phase, Envelope, Dry/Wet, a Clip section, a Sidechain panel.
- Other devices seen: Arpeggiator, MIDI Effect Rack, Pitch, Note Echo, Velocity, MIDI Monitor (MPE / Note / Flow views), Instrument Rack with chains, Utility (Bass Mono 120 Hz), Spectrum.
- Control Bar in 12.x shows **Link · Follow · Tap · tempo**. The "Follow" in the Control Bar = Follow playback (scroll with the playhead).

**Relevance:** these are exactly the transition tools for DJ edits and mixes: freeze/echo-out, reverse tails, filter sweeps, gated tremolo, and the mute-drop. Grouping so FX hit instrumentals but not acapellas is directly useful for mashups.

---

## V8 — Wordplay concept (transcripts only; both use DJ software, not Ableton)
- justin spiegel, "DJ Wordplay Tutorial" (9pYQhNC4VfA, 2023, djay Pro AI) and Nick Spinelli, "How ANY DJ Can Come Up With Wordplays" (z7fA3vq999E, 2021). Off The Rack Jack and Ben Lam videos had no captions, so they were skipped.
- **Definition:** a transition driven by lyrics, not genre, BPM or key. Song A sings a line and song B answers or continues it (e.g. Lil Mama "Lip Gloss" 96 BPM → Coi Leroy "Players" 105 BPM; Ed Sheeran "Shape of You" → "No Diggity").
- **Method:** (1) always listen for lyric links and keep a notes list of ideas; (2) mark a **start** point and an **end** point in the outgoing song (the phrase that sets up the word); (3) in the incoming song, set a start point and a **2-bar instrumental loop** (stems: instrumental only) to sit under the outgoing vocal; (4) bring the tempos together gradually (96 → 105); (5) at the exact word, switch A to vocals-only or cut it and drop B, so the line lands on B's matching lyric; (6) design it so **non-DJs get it instantly** (obvious lyric links beat clever deep ones).
- **Ableton translation (my synthesis from the manual + V4/V5/V6):** Arrangement, two tracks (+ stems of each via Separate Stems). Warp both (Complex Pro for vocals). Use **Locators** as the start/end cue points (Set button, rename with ⌘R). **Split (⌘E) at the word boundary**, then delete or deactivate (0) the rest of A's vocal. Loop 2 bars of B's instrumental stem (⌘L / duplicate ⌘D) under A's lead-in. Tempo automation on Main (Song Tempo) to glide between BPMs, or leave each clip warped to one tempo. Add short fades at the cut (F / ⌘⌥F), and a delay throw (Echo send) on A's last word to cover the switch. For word-by-word edits, Simpler Slice mode (V4) or Arrangement splitting both work.

---

## V9 — Ableton Tips by PML (Boris), "How to Warp Audio in Ableton: Sync Vocals, Pitching & Time Stretching" (n7huUcBA-pQ, 19/09/2024, 15:17)

Live 12 (Windows build, Ctrl shortcuts; pre-12.1 Browser). **The single most important mashup skill: warping a full song when you don't know its BPM.**

### Settings he recommends (Settings → Record, Warp & Launch, all seen)
Record: File Type WAV, Bit Depth 24, Count-In None, Exclusive Arm/Solo, Clip Update Rate 1/16, Record Session automation in Armed Tracks, Start Transport With Record On. **Warp/Fades: Loop/Warp Short Samples = Unwarped One Shot; Auto-Warp Long Samples = Off; Default Warp Mode = Complex; Create Fades on Clip Edges = Off.** Launch: Default Launch Mode Trigger, Default Launch Quantization Global, Select on Launch On, Select Next Scene on Launch On, Start Recording on Scene Launch Off. Tap Tempo: Start Transport With Tap Tempo On. MIDI Note Drawing: Draw Mode with Pitch Lock Off. (Settings tabs: Display & Input, Theme & Colors, Audio, Link Tempo & MIDI, File & Folder, Library, Plug-Ins, Record Warp & Launch, Licenses & Updates.)
> My note for Evan: turning Auto-Warp off means every song comes in unwarped and you warp it by hand. That's more reliable for full songs, which he says Live "gets confused" by. Alternatively, keep it on, check the result, and fix it by the same method. Either works if you always verify with the metronome.

### Method A — full track, unknown BPM (confirmed step by step)
1. Drop the song on an audio track in Arrangement (it arrives unwarped; BPM field shows 120.00 as a placeholder).
2. Clip View → **Warp on** (Complex).
3. **Find the first kick** where the drums start. Don't start from an intro with no drums. Zoom in so you see the kick's transient. There's a grey pseudo-marker (transient) on it.
4. **Right-click that transient → Set 1.1.1 Here.** Bar 1 is now the first kick. The clip start/position fields go negative (e.g. Position −16.2.2) because the intro sits before bar 1. Drag the start marker back to the file's start to keep the intro.
5. Take a **later kick** (e.g. the 3rd), drag its marker onto its beat (1.3).
6. Turn the **metronome on** and play different parts; it drifts further as you go.
7. Pick a **kick much further into the song**. **Shift-drag** the pseudo-marker onto the right bar/beat (Shift moves the invisible marker without committing earlier ones).
8. Check the middle and end; nudge where needed. **The BPM field now shows the real tempo (123.27 → he types 123.00).** If you know the BPM from Beatport etc., typing it first gets Live most of the way immediately.
9. Clip View also has **Envelopes** tab with Clip / Gain / "Linked" selectors for clip gain envelopes.

### Method B — acapella/vocal phrase
- If the file name has the BPM (122bpm), set the project tempo first, drop it in and enable Warp; it lands on the beat.
- Unknown BPM, clean end: enable Warp, **Shift-drag the clip end** (Arrangement) until it lands on a bar line; BPM field reads the tempo (122).
- Unknown BPM, irregular cut: listen for the phrase's downbeat → marker → Set 1.1.1 Here; add a marker where "2" and "3" should fall; check with the metronome (121.73 → round to 122). Then **Warp From Here (Straight)** from the 1.1.1 marker to lock a constant tempo.
- Right-click menu (this build): … Set 1.1.1 Here · Warp From Here · Warp From Here (Start at 120.00 BPM) · **Warp From Here (Straight)** · Warp 120.00 BPM From Here · Warp Sample as 8-Bar Loop · Adaptive Grid (Widest/Wide/Medium/Narrow/Narrowest) · Fixed Grid (8 Bars … 1/32, Off) · Narrow/Widen Grid (Ctrl+1/2) · Triplet Grid (Ctrl+3).
- **For vocals: Complex Pro ("Pro" in the menu) with Formants (100.00 default) and Envelope (128 default).** Formants matter when pitching a vocal (+7 st demo); at 100 the voice keeps its character.

### Method C — drums
- **Beats mode** keeps transients crisp when you change tempo a lot (Complex smears kicks at half tempo). Preserve = Transients; Transient Loop Mode (→ ⇄ ⇆); Transient Envelope 100 (lower = shorter chops).
- Loop with unknown tempo: Shift-drag clip end to a whole bar (usually 1, 2 or 4 bars) → BPM reads correctly (e.g. 118.12 → 126).

**Relevance:** Method A is how every song in a mashup, bootleg or DJ mix gets locked to the grid. Method B is for acapellas. Complex Pro + Formants is how to pitch a vocal into another song's key.

---

## V10 — Ableton Tips by PML, "5 Unique Ways of Using Stem Separation in Ableton" (xZqjwHpmzDs, 08/02/2026, 12:14)

Material: a 123 BPM loop built only from sounds extracted from four full tracks. (Windows, Live 12.3+.)
- Dialog seen again: Separate Stems has Vocals / Drums / Bass / Others; he **unticks Vocals** when a track has none. **High Speed** mode is fine for sampling; High Quality for anything exposed. Result: a group track named "STEMS [date time]" containing Drums STEMS / Bass STEMS / Others STEMS.
- **Extracting a one-shot kick from a drum stem (useful for bootlegs):** split out one kick (⌘E) → drag it to a new audio track → **Warp off** → move the clip start onto the transient → trim the tail → **EQ Eight** high-cut to remove shaker bleed and a low-cut on the lowest rumble. Pro version: duplicate onto two tracks, one EQ'd to lows (sub, long) and one to highs (click, short fade), for a clean layered kick. Clip fades are editable when automation view is off.
- **Toms/percussion:** chop hits from Others/Drums and **transpose** them (e.g. −4 st) to make a new loop without processing.
- **Drone from an "Others" stem:** looped fragment + Hybrid Reverb (Shimmer) + EQ low-cut + high-shelf boost.
- **Top loop:** loop a fragment of the drum stem, then EQ + **sidechain** (a Shaper/volume-shaping device with a rate of 1/4 and Utility) to duck the kick out, leaving hats; then **Freeze and Flatten** to print it to audio.
- **Bass note:** isolate one bass note from the Bass stem → Warp off → **Transpose −9 st** → **Utility Left channel only** (Input "Left") to make it mono and phase-free → trim to the transient → Roar saturation (Noise mode, Drive automation) → EQ roll-off → Freeze & Flatten → sequence the note. Final bass: EQ at ~300 Hz, Erosion for analog noise.
- Shaker: turn grid snapping off (⌘4) to cut a single hit cleanly.
- Track headers show "Keep Latency" and delay-compensation (ms) fields in this layout, and the Info View is hidden.

**Relevance:** bootleg drum replacement, finding one-shots from the original track so the edit still sounds like it, and using Utility/EQ to clean stems.

---

## Manual check — Crossfader & cueing (Live 12 manual, Mixing chapter)
- Show the crossfader and A/B assign buttons via **View → Mixer Controls** (or the mixer-view menu at the bottom right). **The manual gives no keyboard shortcut for it.** A web source claiming ⌘⌥F is wrong: ⌘⌥F is Create Fade/Crossfade in Arrangement.
- Each track has **A** and **B** crossfade-assign buttons. A = full volume while the crossfader is in its left half; B = attenuated only as the fader moves left past centre. Unassigned tracks ignore the crossfader.
- **Seven crossfade curves**: right-click the crossfader.
- Headphone cueing: switch the Main track's **Solo/Cue** toggle to Cue, set **Cue Out** to a different hardware output than Main (needs a multi-output interface or DJ controller), set Cue Volume, then press a track's Cue (headphone) button to prelisten.
- Map the crossfader to a controller via **MIDI Map mode (⌘M)**.

---

## Synthesis — Evan's five goals, mapped to Live 12.4.6

1. **Mashup:** set tempo → import both songs into Arrangement → warp each (V9 Method A: first kick → Set 1.1.1 Here → Shift-drag later kicks → check with the metronome; or Warp From Here (Straight)) → Separate Stems on the vocal song (keep Vocals) → Complex Pro + Formants on the acapella → Transpose to match key (Live has **no built-in audio key detection**; use known keys from Beatport/Mixed In Key/Rekordbox and the Camelot wheel, then check by ear; keep within about ±2–3 st) → split/duplicate phrases (⌘E/⌘D) → vocal low-cut EQ + send reverb/delay → fades → export.
2. **Transitions** (within an edit or between songs): filter sweeps (Auto Filter Frequency/Resonance automation), delay/echo throws and freezes, reverb tails with inserted silence, reverse snares/cymbals (R), Auto Pan-Tremolo gating, Beat Repeat, the mute-drop (Speaker On automation), EQ Three bass swaps, tempo ramps on Main. Group instrumentals separately from vocals so FX hit one and not the other. One automation lane per parameter (A to show).
3. **Wordplay edit:** find lyric links; mark start/end with locators; stems for each song; split at the word boundaries (⌘E), delete or deactivate the rest, loop the incoming instrumental under the outgoing vocal, cut to the matching lyric on the downbeat; fade/delay-throw the last word. For word-level rearranging: vocal stem → Simpler Slice (Sensitivity down so slices = words) → trigger in a new order, or cut and rearrange clips in Arrangement.
4. **Bootleg:** V5 template: BPM first → stems → split and colour sections → deactivate original drums/bass in the drop → new drums (breaks chopped with ⌘E, one-shots extracted from stems per V10) and bass → fills (reverse snares) → loudness-match the original (Limiter/Saturator soft clip/Utility, Spectrum to compare lows) → export WAV 24-bit (+MP3).
5. **DJ mix:** V6 template: two deck tracks alternating A/B, each EQ Three + Utility → MASTER OUT FX bus → Limiter on Main (True Peak/Soft Clip) with −9 dB deck headroom; songs warped and phrase-aligned; bass swaps by GainLo automation; fades; clip gain to level-match; Song Tempo automation for BPM changes; optional crossfader A/B + Cue for live performance in Session View; Collect All and Save; export the Main as one file.
