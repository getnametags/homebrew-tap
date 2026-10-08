cask "nametags" do
  version "0.4.5"
  sha256 "e97ce86a3527501d14555fb9d51a0b49121b9b84796bb1bb2b17a292b0496436"

  url "https://api.nametags.site/desktop/install/#{version}/mac"
  name "Nametags"
  desc "Name, role and company on your video, in every meeting app"
  homepage "https://www.nametags.site/"

  livecheck do
    url "https://api.nametags.site/desktop/releases/latest"
    strategy :json do |json|
      json.dig("release", "version")
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Nametags.app"

  uninstall quit: "nerdev.com.nametags"

  zap trash: [
    "~/Library/Application Support/nerdev.com.nametags",
    "~/Library/Caches/nerdev.com.nametags",
    "~/Library/Group Containers/T7AG6F3KVC.nerdev.com.nametags",
    "~/Library/Logs/nerdev.com.nametags",
    "~/Library/Preferences/nerdev.com.nametags.plist",
    "~/Library/WebKit/nerdev.com.nametags",
  ]

  caveats <<~EOS
    Open Nametags and follow its setup steps. It installs its camera and
    asks you to approve it in
      System Settings → General → Login Items & Extensions
    Then choose "Nametags" as the camera in your meeting app.
  EOS
end
