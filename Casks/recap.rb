cask "recap" do
  version "0.2.0"
  sha256 "69f405ba279de46366abe72e7f9825286b70d3fb10dd6bd261422627eb1df552"

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
