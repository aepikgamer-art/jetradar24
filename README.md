# JetRadar24 ✈️

The ultimate native iOS flight tracking client featuring a **Liquid Glass** UI, rotatable emoji plane markers (`✈️`), and integrated **JetPhotos** spotter feeds.

## Features

- **Liquid Glass UI**: Modern iOS frosted glass blur effects (`.ultraThinMaterial`) and glowing dark-mode HUD overlays.
- **Emoji Plane Markers**: Rotatable, heading-aligned airplane emojis (`✈️`) acting as live radar blips on Apple MapKit.
- **JetPhotos Tab**: Dedicated spotter tab featuring high-resolution aircraft registrations, photography credits, and operator stats.
- **GitHub Actions IPA Build**: Automated CI/CD pipeline compiling the SwiftUI app and packaging `.ipa` artifacts on every push.
- **AltStore Source (AltDirect)**: Fully configured `altstore.json` manifest for direct sideloading and source distribution.

---

## Installation via AltStore

1. Open AltStore on your iOS device.
2. Navigate to the **Sources** tab and tap **Add Source (`+`)**.
3. Enter your repository source URL:
   ```text
   https://raw.githubusercontent.com/aepikgamer-art/jetradar24/main/altstore.json
   ```
4. Install **JetRadar24** directly from your AltStore sources list.

---

## Building from Source

1. Clone the repository:
   ```bash
   git clone https://github.com/aepikgamer-art/jetradar24.git
   cd jetradar24
   ```
2. Open the project in Xcode:
   ```bash
   open JetRadar24.xcodeproj
   ```
3. Select your development team and hit `Cmd + R` to run in the simulator or on your device.
