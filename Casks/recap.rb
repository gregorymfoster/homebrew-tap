cask "recap" do
  version "0.3.0"
  sha256 "74588c6f399a90ba55fbe8b1338d9e6eff2eaef1116608c1467bdc192c3f31b1"

  url "https://github.com/gregorymfoster/recap/releases/download/v#{version}/Recap-#{version}.dmg"
  name "Recap"
  desc "Private, offline meeting transcription"
  homepage "https://gregorymfoster.github.io/recap/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Recap.app"

  zap trash: [
    "~/Library/Application Support/Recap",
    "~/Library/Caches/com.gregfoster.recap",
    "~/Library/HTTPStorages/com.gregfoster.recap",
    "~/Library/Preferences/com.gregfoster.recap.plist",
  ]

  caveats <<~EOS
    Recordings, transcripts, and notes are stored in ~/Recap (or your chosen
    folder) and are not removed on uninstall.
  EOS
end
