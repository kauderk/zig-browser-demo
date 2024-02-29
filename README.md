
source: https://gerritniezen.com/zig-and-webassembly-in-the-browser

```
zig build-lib src/main.zig -target wasm32-freestanding -dynamic -rdynamic
python -m http.server
```