# homebrew-tap

Homebrew formulae for [zgix](https://github.com/chy3xyz/zgix) — a
zero-allocation L4/L7 edge proxy in Zig — plus
[zdoc](https://github.com/chy3xyz/zdoc) (documentation sites from Markdown),
[mem3](https://github.com/chy3xyz/mem3) (memory store for agents),
snapshots of [zrk](https://github.com/zoxy-io/zrk) (load generator) and
[zurl](https://github.com/zoxy-io/zurl) (HTTP/1.1 client), and the
[zmodu](https://github.com/chy3xyz/zmodu) framework's CLI.

## Install

```sh
brew tap chy3xyz/tap
brew trust chy3xyz/tap          # once per machine; Homebrew ignores untrusted taps
brew install zdoc                # documentation sites from a folder of Markdown
brew install mem3                # memory store for agents (prebuilt binaries)
brew install zgix                # zero-allocation L4/L7 edge proxy (prebuilt binaries)
brew install zrk                 # constant-throughput HTTP load generator (prebuilt binaries)
brew install chy3xyz/tap/zurl    # std.Io-native HTTP/1.1 client (prebuilt binaries)
brew install zmodu               # framework CLI (prebuilt binaries)
```

`zurl` needs the fully-qualified `chy3xyz/tap/zurl` name: `homebrew/core`
already has an unrelated `zurl` (fanout's ZeroMQ-based HTTP/WebSocket proxy
worker), and a bare `brew install zurl` resolves there instead, pulling in
`qtbase`/`zeromq` and five other dependencies that have nothing to do with
this one. `zdoc`, `zgix`, `zrk`, and `mem3` have no such collision.

## Migration notes

This tap moved from `zoxy-io/homebrew-tap` when the proxy project renamed
zoxy → zgix and its canonical home became
[chy3xyz/zgix](https://github.com/chy3xyz/zgix). Consequences:

- The old `zoxy` formula stayed behind on the old tap for pre-rename
  binaries; this tap ships `zgix` starting with its first release here.
- `zrk` and `zurl` formulae here are snapshots: those projects still
  publish to `zoxy-io/homebrew-tap` from their own release workflows, so
  check the old tap for their latest versions.

## Formulae

| Formula | Source | Notes |
| ------- | ------ | ----- |
| `zdoc` | prebuilt release binaries from `chy3xyz/zdoc` | macOS/Linux, arm64 + x86_64 |
| `mem3` | prebuilt release binaries from `chy3xyz/mem3` | macOS/Linux, arm64 + x86_64; Linux builds are static musl |
| `zmodu` | prebuilt release binaries from `chy3xyz/zmodu` | macOS/Linux, arm64 + x86_64; framework itself is fetched by consumers via `build.zig.zon` |
| `zgix` | prebuilt release binaries from `chy3xyz/zgix` | macOS/Linux, arm64 + x86_64 |
| `zrk` | prebuilt release binaries from `zoxy-io/zrk` | snapshot; canonical tap `zoxy-io/tap` |
| `zurl` | prebuilt release binaries from `zoxy-io/zurl` | snapshot; collides with `homebrew/core/zurl`, see above |

## Updating

`zgix` updates automatically: `chy3xyz/zgix`'s
`.github/workflows/release.yml` pushes here on every tag, using a
write-access deploy key (`zgix-release-bot`, stored as that repo's
`HOMEBREW_TAP_DEPLOY_KEY` secret). To update any formula by hand, bump
`version` and the four `sha256` values from the release's `SHA256SUMS.txt`.
