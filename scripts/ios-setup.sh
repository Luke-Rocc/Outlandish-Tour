#!/bin/bash
# Laver iOS-projektet på byggemaskinen. ios/ ligger ikke i git; det genskabes ved hvert build.
set -euo pipefail

npx cap add ios
npx cap sync ios

ASSETS=ios/App/App/Assets.xcassets
for f in "$ASSETS"/AppIcon.appiconset/*.png; do cp assets/AppIcon-1024.png "$f"; done
for f in "$ASSETS"/Splash.imageset/*.png; do cp assets/Splash-2732.png "$f"; done

PLIST=ios/App/App/Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName Outlandish" "$PLIST"
# Appen bruger kun almindelig HTTPS, så Apple skal ikke spørge om kryptering ved hvert build.
/usr/libexec/PlistBuddy -c "Add :ITSAppUsesNonExemptEncryption bool false" "$PLIST"

# Hvert build skal have sit eget nummer, ellers afviser Apple uploadet.
sed -i '' "s/CURRENT_PROJECT_VERSION = .*;/CURRENT_PROJECT_VERSION = ${BUILD_NUMBER:-1};/" ios/App/App.xcodeproj/project.pbxproj
