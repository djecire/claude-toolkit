# Warping in Live 12

Contents: where the controls are · settings · Method A (song, known BPM) · Method B (song, unknown BPM) · Method C (acapella or vocal phrase) · Method D (drum loop) · warp modes · the right-click menu · fixing problems · creative uses.

Sources: Live 12 manual "Audio Clips, Tempo, and Warping"; study-log.md V3 (Sequence One) and V9 (PML). Mac shortcuts.

## Where the controls are

Double-click an audio clip to open Clip View at the bottom of the window. The left side is a column of collapsible boxes:

- Clip: name, colour, Start/End, Loop switch, Position/Length, Signature, Groove, Scale.
- Audio: Warp switch, Follow (the Leader/Follower toggle), warp mode menu, the mode's own controls, BPM box with ÷2 and ×2, Gain fader, Pitch knob (Transpose in semitones, with a cents box), Reverse, Edit, RAM, HiQ.
- Transform (audio-to-MIDI tools).

The right side is the Sample Editor: the waveform with a marker strip above it. Yellow tabs are warp markers. Grey ticks are transients, which Live also uses as "pseudo" warp markers: drag one and it becomes real. Tabs at the top switch Sample and Envelopes.

The BPM box updates as you move markers; it reports the tempo the markers imply.

## Settings that matter (Settings → Record, Warp & Launch)

- Default Warp Mode: Complex Pro (Complex is fine on a slow machine).
- Auto-Warp Long Samples: On means every song gets markers automatically; check them with the metronome. Off means every song arrives unwarped and you place markers by hand. Either works; the check is what matters.
- Loop/Warp Short Samples: Unwarped One Shot, so drum hits and effects play at their natural speed.
- Create Fades on Clip Edges: Off, so fades happen only where you draw them.
- Settings → File & Folder → Create Analysis Files: On, so the warp work is saved beside each file (.asd).

## Method A: a full song with a known BPM

1. Type the BPM into the tempo box (top left) before importing.
2. Drag the song onto an audio track in Arrangement View. With Auto-Warp on, Live places markers at that tempo.
3. Double-click the clip. Check the first kick sits on a bar line. If not, right-click the transient on that kick → Set 1.1.1 Here.
4. Turn the metronome on (O) and play the middle and the end. If it drifts, use Method B from step 4.
5. If the file starts with silence or an intro before the first kick, drag the clip's start marker left to keep it.

## Method B: a full song with an unknown BPM

1. Drag the song onto an audio track in Arrangement View and double-click it. In the Audio box turn Warp on and choose Complex Pro.
2. Zoom in on the first kick where the drums start, never on a drumless intro. Right-click its grey transient → Set 1.1.1 Here. That kick is bar 1. The Position box may go negative because the intro now sits before bar 1; that is normal.
3. Find a kick one or two bars later and drag its marker onto the nearest beat line (for example 1.3 or 2.1). The first bar is now measured.
4. Metronome on. Play further into the song. When the click drifts, jump there, Shift-drag the transient of a kick onto the nearest beat line, and check again. Shift moves the grey marker without disturbing earlier ones.
5. Repeat at the middle and near the end until the click stays locked everywhere.
6. Read the BPM box. For a song with a steady tempo, right-click the first marker → Warp From Here (Straight), which sets one tempo for the whole file; then round the BPM box (123.27 → 123). For a song with a wandering tempo (live drummers, old records) keep the markers instead.
7. Drag the start marker back to the file's beginning if you want the intro.

## Method C: an acapella or vocal phrase

- If the file name carries the BPM (for example "…122bpm.wav"), set the tempo box to it first, then import with Warp on. It lands on the beat.
- Unknown BPM with a clean cut at the end: Warp on, then in Arrangement Shift-drag the clip's end until it lands on a bar line. The BPM box now shows the real tempo.
- Unknown BPM, irregular cut: listen for the first downbeat of the phrase, add a marker there (double-click the strip or ⌘I) → Set 1.1.1 Here; add markers where beats 2 and 3 should fall; check with the metronome; round the BPM; then Warp From Here (Straight).
- Mode: Complex Pro with Formants at 100 and Envelope at 128. Formants keep the voice sounding human when you transpose it.

## Method D: a drum loop or break

- Use Beats mode (Preserve: Transients). It keeps kicks and snares sharp even when the tempo changes a lot. Transient Loop Mode and Transient Envelope control what happens between hits; leave defaults unless it sounds choppy.
- Unknown tempo: Warp on, Shift-drag the clip end to a whole number of bars (1, 2 or 4). The BPM box reads the tempo (118.12 → 126, for example).

## Warp modes

| Mode | Use for | Controls | Notes |
| --- | --- | --- | --- |
| Complex Pro | Full songs, acapellas, chords | Formants, Envelope | Best quality; heaviest on CPU. Freeze the track if it stutters |
| Complex | Full songs on a slow machine | none | Slightly rougher |
| Beats | Drum loops, breaks, percussion | Preserve, Transient Loop Mode, Transient Envelope | Choppy on sustained sounds |
| Tones | Single-note lines: a bass, a lead vocal | Grain Size | Rarely needed once Complex Pro exists |
| Texture | Pads, noise, drones | Grain Size, Fluctuation | Creative use |
| Re-Pitch | Slowdowns and speed-ups that change pitch | none (Transpose disabled) | Like a turntable: tempo changes pitch |

## The right-click menu in the Sample Editor (Live 12)

Delete · Delete Transient(s) (⇧⌘Delete) · Zoom To Fit (Z) · Zoom Back from Clip Selection (X) · Fit Content To View Width (W) / Height (H) · Quantize (⌘U) · Quantize Settings… (⇧⌘U) · Extract Groove(s) · Activate Loop (⌘L) · Slice to New MIDI Track · Convert Harmony / Melody / Drums to New MIDI Track · Normalize Clip Sample · Crop Clip Sample (⇧⌘J) · Split Clip (⇧⌘E) · Manage Sample File · Show in Browser · Show in Finder · Show Similar Files · Set 1.1.1 Here · Warp From Here · Warp From Here (Start at … BPM) · Warp From Here (Straight) · Warp … BPM From Here · Warp Sample as N-Bar Loop · Snap to Grid (⌘4) · Adaptive Grid / Fixed Grid options.

What the Warp commands mean:
- Warp From Here: re-run the automatic analysis from this marker to the end.
- Warp From Here (Start at … BPM): the same, but assume the set's current tempo as the starting guess (useful after tapping the tempo).
- Warp From Here (Straight): one constant tempo from here on. The fast path for modern dance music.
- Warp … BPM From Here: assume the clip is exactly at the set's tempo.
- Warp Sample as N-Bar Loop: for loops whose length you know.

## Fixing common problems

| Symptom | Cause | Fix |
| --- | --- | --- |
| Song runs at half or double speed | Tempo detected wrong by a factor of 2 | Click ×2 or ÷2 beside the BPM box |
| On the click at the start, off later | Only the first bar is measured | Method B steps 4–5: markers further in, then Warp From Here (Straight) |
| Bar 1 lands in silence | File has a lead-in | Set 1.1.1 Here on the first kick; drag the start marker back for the intro |
| Vocal sounds wobbly or metallic | Wrong warp mode | Complex Pro, Formants 100 |
| Kicks smear when slowed a lot | Complex on drums | Beats mode |
| Turning Warp off then on shows a dialog | Live asks whether to keep the current timing | Yes keeps the timing you hear now; No goes back to the old markers |
| Whole song drifts after a tempo change mid-song (DnB double-time, live band) | One straight tempo can't fit | Markers per section; use Warp From Here on each section rather than Straight |
| The clip loops the wrong length | Loop box set to a short length | Clip box → Loop off, or set Length in bars |

## Creative uses

- Shift-drag a clip's edge in Arrangement to stretch or squash it in time (a bracket cursor appears). ⌘J consolidates it so you can stretch again.
- Re-Pitch mode plus a stretched last beat gives a record-style slowdown.
- Warp off and turn the Pitch knob: speed and pitch move together like a tape machine.
- Add markers inside a phrase and drag them to make stutters and stretches; try Tones or Texture for different grain.
- Shift-drag on the waveform slides the audio under a marker without moving the marker.
