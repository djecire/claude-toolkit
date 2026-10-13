# FL Studio → Ableton Live 12: names and screen map

Contents: the translation table · the seven areas of the window · the Control Bar, left to right.

## Translation table

| In FL Studio | In Live 12 | How |
| --- | --- | --- |
| Playlist (song mode) | Arrangement View | Tab toggles to it |
| Pattern mode / Performance mode | Session View | Clips loop in slots; a scene launches a whole row. Both views are always live; there is no pattern/song switch |
| Pattern | Clip | Audio or MIDI, one track per clip |
| Channel Rack | Tracks (Drum Rack for drums) | One instrument per MIDI track, ⇧⌘T |
| Piano roll | MIDI Note Editor (Clip View) | Double-click a MIDI clip. B draws, ⌘U quantizes |
| Mixer insert plus routing | The track itself | Every track has its own fader, pan and effect chain |
| Mixer sends | Return tracks and Send knobs | ⌘⌥T adds a return; turn a track's A/B send to feed it |
| Effect slots | Device View chain | Drag from the Browser, or select and press Enter |
| Stretch / Resample modes | Warp and Warp Mode | Clip View → Audio box → Warp switch and mode menu |
| Slicing, Newtime markers | Warp markers | Double-click the marker strip, or ⌘I |
| Channel pitch knob | Clip Transpose | Clip View → Audio box → Pitch (semitones and cents) |
| Paint tool / slice tool | Draw Mode / Split | B; ⌘E splits at the selection |
| Snap menu | Grid | ⌘1 / ⌘2 narrow or widen, ⌘4 snap on/off, hold ⌘ to ignore |
| Automation clips | Automation envelopes | A shows the lanes in Arrangement |
| Consolidate / render to audio | Consolidate · Bounce · Freeze | ⌘J merges clips; ⌘B bounces to a new track; ⌘⌥⇧F freezes |
| Stem separation (FL 2024+) | Separate Stems | Right-click a clip → Separate Stems to New Audio Tracks (Suite) |
| Mute channel | Track Activator | Click the numbered button, or select and press 0 |
| Hint bar | Info View | Shift+? |
| Export (Ctrl+R) | Export Audio/Video | ⌘⇧R |
| F5 / F6 / F9 windows | Tab · ⇧Tab · ⌘⌥M | Views are panes of one window, not separate windows |

## The seven areas of the window

- Control Bar (top): tempo, time signature, metronome, transport, recording, the Arrangement loop, the Key/Scale selector, Draw Mode, Key/MIDI map buttons, CPU meter. FL: the top toolbar.
- Browser (left): Live's sounds, devices, samples, plug-ins, Splice (12.3+) and your own folders under Places. Click a file to preview; ⌘F searches; ⌘⌥B hides and shows it. FL: the Browser.
- Session View (centre): columns are tracks, rows are scenes. Clips sit in slots and loop when launched, quantised to the bar. FL: nothing direct; Performance mode is the nearest.
- Arrangement View (centre, Tab): the timeline. A Session clip playing on a track overrides that track's Arrangement; the orange Back to Arrangement button (F10) hands control back. FL: the Playlist.
- Mixer section (inside Session View, and at the right of Arrangement since 12.0): volume, pan, Send knobs, Track Activator (the numbered mute), Solo, Arm, crossfade A/B buttons when shown. ⌘⌥M toggles it. FL: the Mixer, but every Live track is already its own insert.
- Info View (bottom left, Shift+?): explains whatever is under the mouse. Learn View (⌘⌥7, 12.4) holds Ableton's own video lessons. FL: the hint bar.
- Clip View / Device View (bottom): double-click a clip for Clip View (Sample Editor for audio: Warp, BPM, Transpose, Gain, loop and markers; Note Editor for MIDI). Double-click a track name for Device View (the effect chain, left to right). ⇧Tab switches between them. FL: Edison plus the sampler settings, and the mixer insert's effect slots.

The status bar along the bottom shows messages and selection details. The small buttons at its right switch the main view and show or hide Clip/Device View; if an area has vanished, look there first.

## The Control Bar, left to right

- Link, Tap, Tempo, Nudge arrows, time signature, Metronome (O) with its count-in dropdown, Global Launch Quantization (⌘6–⌘9; off ⌘0).
- Follow (scroll with the playhead), Arrangement Position, Play (Space; ⇧Space continues from the stop point), Stop, Arrangement Record (F9), MIDI Arrangement Overdub, Automation Arm, Re-Enable Automation, Capture MIDI, Session Record (⌘⇧F9).
- Loop switch, Loop Start and Loop Length (⌘L loops the selection), Punch-In and Punch-Out.
- Scale/Key selector (MIDI only), Draw Mode (B), Key Map (⌘K) and MIDI Map (⌘M), CPU and disk meters, MIDI in/out lights.
