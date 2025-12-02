# Homebrew Tap for Dexicon CLI

This is the Homebrew tap for [Dexicon CLI](https://dexicon.ai).

## Installation

```bash
brew tap Dexicon-AI/tap
brew install dexicon
```

## Updating the Formula

After each release, update the formula with new SHA256 hashes:

1. Download the binaries from the [release page](https://github.com/Dexicon-AI/get-dexicon-cli/releases)

2. Generate SHA256 hashes:
   ```bash
   shasum -a 256 dexicon-cli-darwin-arm64
   shasum -a 256 dexicon-cli-darwin-amd64
   shasum -a 256 dexicon-cli-linux-amd64
   ```

3. Update `Formula/dexicon.rb`:
   - Update the `version` line
   - Replace each `sha256` placeholder with the corresponding hash

4. Commit and push to this repo
