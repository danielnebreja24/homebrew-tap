# Homebrew cask for a personal tap.
#
# Publish this as a repo called `homebrew-tap`, with this file at
# `Casks/purrlet.rb`, then people install with:
#
#     brew tap danielnebreja24/tap
#     brew install --cask purrlet
#
# The DMG is signed and notarized, so no Gatekeeper workaround is needed.
# Update `version` and `sha256` on every release (after stapling — stapling
# changes the file):
#     shasum -a 256 dist/Purrlet-<version>.dmg
cask "purrlet" do
  version "1.0.0"
  sha256 "0364d629d7c3c54c1c517df7146cbf114b4da002e6399930c610c1c2c581853b"

  # The source repo is private; DMGs are published to a public, releases-only repo.
  url "https://github.com/danielnebreja24/purrlet-releases/releases/download/v#{version}/Purrlet-#{version}.dmg"
  name "Purrlet"
  desc "Menu-bar app showing Claude and Codex usage limits"
  homepage "https://purrlet.nocturnab.com"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Purrlet.app"

  uninstall quit: "com.fujiui.purrlet"

  # Only what Purrlet itself wrote. If the Claude status line was turned on,
  # turn it off in Settings first — that restores ~/.claude/settings.json.
  zap trash: [
    "~/Library/Application Support/Purrlet",
    "~/Library/Preferences/com.fujiui.purrlet.plist",
  ]
end
