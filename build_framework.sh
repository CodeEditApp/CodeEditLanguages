#!/usr/bin/env sh

# This script builds the CodeLanguagesContainer.xcframework
#
# Just call it from the root of the project
# $ ./build_framework.sh
#
# If you need debug output, set the --debug flag
# $ ./build_framework.sh --debug
#
# Created by: Lukas Pistrol on 29.10.2022

# convenience function to print a status message in green
status () {
    local GREEN='\033[0;32m'
    local NC='\033[0m' # No Color 
    echo "${GREEN}◆ $1${NC}"
}

# If --debug set -quiet flag and redirect output to /dev/null
if [ "$1" = "--debug" ]; then
    QUIET_FLAG=""
    QUIET_OUTPUT=/dev/stdout
else
    QUIET_FLAG="-quiet"
    QUIET_OUTPUT=/dev/null
fi

# Set pipefail to make sure that the script fails if any of the commands fail
set -euo pipefail

# build the framework project `CodeLanguages-Container`
status "Clean Building CodeLanguages-Container.xcodeproj..."
xcodebuild \
    -project CodeLanguages-Container/CodeLanguages-Container.xcodeproj \
    -scheme CodeLanguages-Container \
    -destination "platform=macOS" \
    -derivedDataPath DerivedData \
    -configuration Release \
    $QUIET_FLAG clean build &> $QUIET_OUTPUT
status "Build complete!"

# set path variables
PRODUCTS_PATH="$PWD/DerivedData/Build/Products/Release"
FRAMEWORK_PATH="$PRODUCTS_PATH/CodeLanguages_Container.framework"
OUTPUT_PATH="CodeLanguagesContainer.xcframework"

# remove previous generated files
rm -rf "$OUTPUT_PATH"
rm "$OUTPUT_PATH".zip
status "Removed previous generated files!"

# build the binary framework
status "Creating CodeLanguagesContainer.xcframework..."
xcodebuild \
    -create-xcframework \
    -framework "$FRAMEWORK_PATH" \
    -output "$OUTPUT_PATH" &> $QUIET_OUTPUT

# zip the xcframework
status "Zipping CodeLanguagesContainer.xcframework..."
zip -r -q "$OUTPUT_PATH".zip "$OUTPUT_PATH"

# remove the unzipped xcframework
rm -rf "$OUTPUT_PATH"

status "CodeLanguagesContainer.xcframework.zip created!"

# copy language queries to package resources
# set path variables
CHECKOUTS_PATH="$PWD/DerivedData/SourcePackages/checkouts"
RESOURCES_PATH="$PWD/Sources/CodeEditLanguages/Resources"

# remove previous copied files
status "Copying language queries to package resources..."
rm -rf "$RESOURCES_PATH"

# find and copy language queries 
LIST=$( echo $CHECKOUTS_PATH/tree-* )

for lang in $LIST ; do
    name=${lang##*/}
    mkdir -p $RESOURCES_PATH/$name
    highlights=$( find $lang -type f -name "*.scm" )
    for highlight in $highlights ; do
        highlight_name=${highlight##*/}
        cp $highlight $RESOURCES_PATH/$name/$highlight_name
    done
done
status "Language queries copied to package resources!"

# cleanup derived derived data 

if [ -d "$PWD/DerivedData" ]; then
    status "Cleaning up DerivedData..."
    rm -rf "$PWD/DerivedData"
fi

status "Done!"
