#!/usr/bin/env sh

set -euo pipefail

# build the framework project `CodeLanguages-Container`
xcodebuild \
    -project CodeLanguages-Container/CodeLanguages-Container.xcodeproj \
    -scheme CodeLanguages-Container \
    -destination "platform=macOS" \
    -derivedDataPath DerivedData \
    -configuration Release \
    -quiet clean build

# set path variables
PRODUCTS_PATH="$PWD/DerivedData/Build/Products/Release"
FRAMEWORK_PATH="$PRODUCTS_PATH/CodeLanguages_Container.framework"
OUTPUT_PATH="CodeLanguagesContainer.xcframework"

# remove previous generated files
rm -rf "$OUTPUT_PATH"
rm "$OUTPUT_PATH".zip

# build the binary framework
xcodebuild \
    -create-xcframework \
    -framework "$FRAMEWORK_PATH" \
    -output "$OUTPUT_PATH"

# zip the xcframework
zip -r -q "$OUTPUT_PATH".zip "$OUTPUT_PATH"

# remove the unzipped xcframework
rm -rf "$OUTPUT_PATH"

# copy language queries to package resources
# set path variables
CHECKOUTS_PATH="$PWD/DerivedData/SourcePackages/checkouts"
RESOURCES_PATH="$PWD/Sources/CodeEditLanguages/Resources"

# remove previous copied files
rm -rf "$RESOURCES_PATH"

# find and copy language queries 
LIST=$( echo $CHECKOUTS_PATH/tree-* )

for lang in $LIST ; do
    name=${lang##*/}
    echo "Copying queries: $name"
    mkdir -p $RESOURCES_PATH/$name
    highlights=$( find $lang -type f -name "*.scm" )
    for highlight in $highlights ; do
        highlight_name=${highlight##*/}
        cp $highlight $RESOURCES_PATH/$name/$highlight_name
    done
done

echo "Done!"