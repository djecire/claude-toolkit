# Stems and keys

Contents: stem separation · what to keep for what · pulling one-shots out of a stem · chopping a vocal into words (Simpler Slice) · matching keys (Camelot) · transposing a vocal.

Sources: Live 12 manual "Stem Separation" and release notes; study-log.md V4 (pointblank), V5 (STRANJAH), V10 (PML).

## Stem separation (Live 12.3 and later, Suite only)

Right-click an audio clip in Arrangement or Session, or a file in the Browser → Separate Stems to New Audio Tracks.

The dialog has four rows with tick boxes: Vocals, Drums, Bass, Others; a High Speed / High Quality switch; the note "This action will stop audio."; and Separate / Cancel. High Quality takes longer (a minute or two per song) and is cleaner; use it for anything the listener will hear exposed. High Speed is fine for grabbing a kick.

Result: a new group track named after the song, containing one audio track per stem ("Vocals <song>", "Drums <song>" …), with clips lined up exactly with the original. The stem files are written to <Project>/Samples/Processed/Stems/, so File → Collect All and Save before moving or sharing the project.

Added in 12.4: select part of a clip in Arrangement, right-click → Separate Stems for Time Selection to process only that section; and a Merge to Single Track tick box to get one clip back. On macOS 26.4 and later the separation runs on the GPU and is faster. Ableton recommends 16 GB of RAM for High Quality.

Artifacts: an exposed vocal can carry faint smearing, and some of the bass's top end can land in Others. Both vanish once other sounds sit on top. Keep the vocal in the mix, not solo, and don't judge stems in isolation.

## What to keep for what

| Goal | Keep | Deactivate (select, press 0) |
| --- | --- | --- |
| Acapella | Vocals | Drums, Bass, Others |
| Instrumental | Drums, Bass, Others | Vocals |
| Drums only (for a bootleg groove reference) | Drums | the rest |
| Chords and pads to sample | Others | the rest |

## Pulling a one-shot out of a stem

1. Zoom into the Drums stem, select one kick (or snare), ⌘E on both sides.
2. Drag the piece to a new audio track. In Clip View turn Warp off. Move the clip start onto the transient.
3. Trim the tail; add a short fade out.
4. EQ Eight: a high cut to remove hat or shaker bleed, a gentle low cut under the sub.
5. Optional layered kick: duplicate onto two tracks, one EQ'd to lows (long), one to highs (short), and balance them.

Same idea for a single bass note: isolate it, Warp off, Transpose to the note you need, Utility set to one channel for a mono sub, then Freeze and Flatten the track to print it.

## Chopping a vocal into words (Simpler Slice)

1. Drag the Vocals stem clip from Arrangement onto an empty Simpler on a MIDI track ("Drop Sample Here").
2. On Simpler's left edge choose Slice. Set Slice By to Transient. Lower Sensitivity (100% gives many tiny slices; around 30–40% gives whole words or phrases). Slice markers appear as vertical lines; drag them to adjust.
3. Each slice maps to a MIDI note from C1 upwards. Arm the track and play the words from the keyboard (M turns the computer keyboard into a MIDI keyboard; Z and X move octaves).
4. Record the new order, then ⌘A and ⌘U to quantize the notes.
5. Add short Fade In and Fade Out on the slices to remove clicks. Transp shifts the pitch if the words need to sit in a new key.

For rearranging whole phrases, splitting the audio clip in Arrangement (⌘E) and moving pieces is quicker than Simpler.

## Matching keys

Live 12 cannot detect the key of an audio file. Take the key from Rekordbox, Beatport, Bandcamp or Mixed In Key, in Camelot form. The Control Bar's Scale box only affects MIDI editing and MIDI devices; it never retunes audio. Convert Harmony to New MIDI Track gives a rough idea of the notes in a chord section, but the ear is the final judge.

Camelot codes (A = minor, B = major):

| Code | Minor key | Code | Major key |
| --- | --- | --- | --- |
| 1A | G♯/A♭ minor | 1B | B major |
| 2A | E♭ minor | 2B | F♯/G♭ major |
| 3A | B♭ minor | 3B | D♭ major |
| 4A | F minor | 4B | A♭ major |
| 5A | C minor | 5B | E♭ major |
| 6A | G minor | 6B | B♭ major |
| 7A | D minor | 7B | F major |
| 8A | A minor | 8B | C major |
| 9A | E minor | 9B | G major |
| 10A | B minor | 10B | D major |
| 11A | F♯ minor | 11B | A major |
| 12A | D♭/C♯ minor | 12B | E major |

Compatible without transposing: same number, either letter (8A with 8B); or one step apart with the same letter (8A with 7A or 9A). Anything else needs the vocal moved to a compatible code, keeping its own letter.

| Instrumental's number minus the vocal's number | Transpose the vocal by |
| --- | --- |
| 0 or ±1 | nothing |
| +2 (same as −10) | +2 semitones |
| −2 (same as +10) | −2 semitones |
| +7 (same as −5) | +1 semitone |
| −7 (same as +5) | −1 semitone |
| +9 (same as −3) | +3 semitones |
| −9 (same as +3) | −3 semitones |
| ±4, ±8 | 4 semitones: usually too far |
| ±6 | 6 semitones: too far, choose another song |

Why: each semitone moves a key 7 steps clockwise around the wheel (or 5 anticlockwise). Example: vocal in 8A (A minor), instrumental in 10B (D major). 10 − 8 = +2, so +2 semitones takes the vocal to 10A (B minor), which sits with 10B.

## Transposing a vocal

1. Double-click the vocal clip. Audio box → warp mode Complex Pro, Formants 100 (Envelope 128).
2. Pitch knob: the semitones from the table. The small box beside it is cents for fine tuning.
3. Keep within ±3 semitones. Beyond that the voice sounds processed; pick a different instrumental.
4. Play the chorus. If it sounds sour, try the same amount the other way, then re-check the codes.
5. If the instrumental is the one that should move, transpose it instead, but drums and sub bass suffer more than a vocal does.
