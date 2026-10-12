# Third-party assets

## `sounds/alert-01.wav` … `sounds/yup-06.wav` (opencode)

Those 45 files are conversions of the sound effects that ship inside opencode.

- Source: <https://github.com/anomalyco/opencode> — `packages/ui/src/assets/audio/`
  (45 `.mp3` files, and the same 45 again as `.aac`).
- Converted with:
  `ffmpeg -i <id>.mp3 -c:a pcm_s16le -ar 44100 -ac 1 sounds/<id>.wav`
- Upstream ships them inside the MIT-licensed `@opencode/ui` package:
  `packages/ui/package.json` sets `"license": "MIT"` and lists `src/assets/audio/*`
  in `files`. The repository carries no separate license, attribution or
  provenance note for the audio itself, and the files carry no author metadata.

opencode's license, reproduced as its terms require:

```
MIT License

Copyright (c) 2025 opencode

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
