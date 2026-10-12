# opencode Notify Sounds

Plays one of opencode's sound effects when something happens in Tern: an agent
turn ends or asks you something, a shell command fails or runs long, or a pane
raises an unseen alert.

## The config file

Open it with the palette command **Notify sounds: open config**, or edit it by
hand — on Windows
`%LOCALAPPDATA%\Tern\plugin-data\opencode-notify\config.json`.

```json
{
  "min_seconds": 30,
  "muted": false,
  "only_unfocused": true,
  "sounds": {
    "alert": "alert-01",
    "done": "bip-bop-01",
    "error": "nope-03",
    "longrun": "yup-01",
    "question": "bip-bop-03"
  }
}
```

The plugin re-reads the file every 6 seconds; **Notify sounds: reload config**
re-reads it at once.

## Which sound for which trigger

`sounds.<trigger>` names a file in the plugin's `sounds/` folder, without the
`.wav`.

| Trigger | Plays when | Default |
| --- | --- | --- |
| `done` | An agent turn ends (the pane stops working). | `bip-bop-01` |
| `question` | The agent waits for you. Tern reports a question and a permission prompt the same way. | `bip-bop-03` |
| `error` | A command finishes with a non-zero status. | `nope-03` |
| `alert` | A pane raises an unseen alert. | `alert-01` |
| `longrun` | A command succeeds and took at least `min_seconds` seconds. | `yup-01` |

## Picking a sound

The 45 sounds that ship with opencode are here: `alert-01` … `alert-10`,
`bip-bop-01` … `bip-bop-10`, `nope-01` … `nope-12`, `staplebops-01` …
`staplebops-07`, `yup-01` … `yup-06`.

For example, `"done": "yup-03"` plays `sounds/yup-03.wav`.

`preview.html` plays all 45 in a browser; the orange-tagged chips are the five
defaults above.

## Your own sounds

Drop `<id>.wav` into `sounds/` and set `sounds.<trigger>` to `<id>`: the folder
is the only place the plugin looks. Use 16-bit PCM (like the shipped files:
`pcm_s16le`, 44100 Hz, mono) — on Windows the file is played by the .NET
`SoundPlayer` behind `wscript.exe`, which loads uncompressed WAV.

Playback per platform: Windows `wscript.exe scripts/play.vbs`, macOS `afplay`,
Linux `paplay`, `aplay` or `ffplay`, whichever is installed.

## Staying quiet

- **Notify sounds: mute or unmute** in the palette, or `"muted": true`.
- `only_unfocused: true` (the default) keeps it silent while the pane the sound
  is about is the one you are looking at. Set it to `false` to hear those too.
- A very short agent turn can fall between two polls (every 300 ms) and go
  unheard.
- Sounds play one at a time, up to 6 queued. The same trigger on the same pane
  within 2 seconds is dropped, and nothing plays in the 600 ms after a sound.

## Commands

| Palette command | Effect |
| --- | --- |
| Notify sounds: mute or unmute | Flips `muted` in the config. |
| Notify sounds: background only | Flips `only_unfocused` in the config. |
| Notify sounds: play every trigger | Plays all five, to test the sounds and the player. |
| Notify sounds: reload config | Re-reads the config file now. |
| Notify sounds: open config | Opens the config file in a Tern block. |
