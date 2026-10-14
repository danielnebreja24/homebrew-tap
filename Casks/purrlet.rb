# Homebrew cask for a personal tap.
#
# Publish this as a repo called `homebrew-tap`, with this file at
# `Casks/purrlet.rb`, then people install with:
#
#     brew install --cask danielnebreja24/tap/purrlet
#
# The full name taps this repo and trusts only this cask in one step
# (Homebrew requires trust for any non-official tap).
#
# The DMG is signed and notarized, so no Gatekeeper workaround is needed.
# Update `version` and `sha256` on every release (after stapling — stapling
# changes the file):
#     shasum -a 256 dist/Purrlet-<version>.dmg
cask "purrlet" do
  version "1.0.3"
  sha256 "6bb1cf5604e89f9a6fca20072fce03dbe3be33bea89f381b0cec1688cd020e94"

  # The source repo is private; DMGs are published to a public, releases-only repo.
  url "https://github.com/danielnebreja24/purrlet-releases/releases/download/v#{version}/Purrlet-#{version}.dmg"
  name "Purrlet"
  desc "Menu-bar app showing Claude and Codex usage limits"
  homepage "https://purrlet.nocturnab.com/"

  auto_updates true
  depends_on macos: :sonoma

  app "Purrlet.app"

  uninstall quit: "com.fujiui.purrlet"

  # Only what Purrlet itself wrote. If the Claude status line was turned on,
  # turn it off in Settings first — that restores ~/.claude/settings.json.
  zap trash: [
    "~/Library/Application Support/Purrlet",
    "~/Library/Preferences/com.fujiui.purrlet.plist",
  ]
end
