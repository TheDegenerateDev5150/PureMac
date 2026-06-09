cask "puremac" do
  version "2.8.0"
  sha256 "88985ee43e16e6a7d45a572234a688f99c08086d282bcbf6f20393fbf95d0267"

  url "https://github.com/momenbasel/PureMac/releases/download/v#{version}/PureMac-#{version}.zip"
  name "PureMac"
  desc "Free, open-source macOS app manager and system cleaner"
  homepage "https://github.com/momenbasel/PureMac"

  app "PureMac.app"

  # Refresh LaunchServices so the Dock/Launchpad icon updates immediately on
  # (re)install instead of showing a stale cached icon (issue #111).
  postflight do
    system_command "/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister",
                   args: ["-f", "#{appdir}/PureMac.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.puremac.app.plist",
    "~/Library/Caches/com.puremac.app",
    "~/Library/LaunchAgents/com.puremac.scheduler.plist",
  ]
end
