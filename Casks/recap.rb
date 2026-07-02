cask "recap" do
  version "0.1.1"
  sha256 "dd0830e39c28f088498d98000f3c433be42e46f091f687f32e096e56cc817807"

  url "https://github.com/gregorymfoster/recap/releases/download/v#{version}/Recap-#{version}.dmg"
  name "Recap"
  desc "Private, offline meeting transcription"
  homepage "https://gregorymfoster.github.io/recap/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

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
