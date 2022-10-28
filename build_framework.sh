#!/usr/bin/env sh

set -euxo pipefail

xcodebuild -project CodeLanguages-Container/CodeLanguages-Container.xcodeproj -scheme CodeLanguages-Container -destination "platform=macOS" -derivedDataPath DerivedData -configuration Release clean build | xcpretty

PRODUCTS_PATH="$PWD/DerivedData/Build/Products/Release"
FRAMEWORK_PATH="$PRODUCTS_PATH/CodeLanguages_Container.framework"
OUTPUT_PATH="CodeLanguagesContainer.xcframework"

rm -rf "$OUTPUT_PATH"
rm "$OUTPUT_PATH".zip
xcodebuild -create-xcframework -framework "$FRAMEWORK_PATH" -output "$OUTPUT_PATH" | xcpretty

zip -r "$OUTPUT_PATH".zip "$OUTPUT_PATH"
rm -rf "$OUTPUT_PATH"
