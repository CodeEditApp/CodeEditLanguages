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
    ARCHS="arm64 x86_64" \
    ONLY_ACTIVE_ARCH=NO \
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
zip -r -q -y "$OUTPUT_PATH".zip "$OUTPUT_PATH"

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

OLD_PWD="$PWD"

for lang in $LIST ; do
    # determine how many targets a given package has
    cd $lang
    
    # get package info as JSON
    manifest=$(swift package dump-package)

    # use jq to get the target path
    targets=$(echo $manifest | jq -r '.targets[] | select(.type != "test") | .path')
    
    # use jq to count number of targets
    count=$(echo $manifest | jq '[.targets[] | select(.type != "test")] | length')
    
    # Determine if target paths are all '.'
    same=1
    for target in $targets; do
        if [[ $target != "." ]]; then
            same=0
            break
        fi
    done

    # loop through targets
    for target in $targets; do
        name=${lang##*/}
        
        # if there is only one target, use name
        # otherwise use target
        if [[ $count -eq 1 || ($count -ne 1 && $same -eq 1) ]]; then
            mkdir -p $RESOURCES_PATH/$name
        else
            mkdir -p $RESOURCES_PATH/$target
        fi
            
        highlights=$( find $lang/$target -type f -name "*.scm" )
        for highlight in $highlights ; do
            highlight_name=${highlight##*/}
            
            # if there is only one target, use name
            # otherwise use target
            if [[ $count -eq 1 || ($count -ne 1 && $same -eq 1) ]]; then
                cp -f $highlight $RESOURCES_PATH/$name/$highlight_name
            else
                cp -f $highlight $RESOURCES_PATH/$target/$highlight_name
            fi
        done
        
        # If target paths are all '.', break out of loop
        if [[ $same -eq 1 || ($count -ne 1 && $same -eq 1) ]]; then
            break
        fi
    done
done

status "Language queries copied to package resources!"

# Clone the neovim-treesitter repository, which has more language query files than
# the language repos contain by default and use query files.
#
# We also copy a license notice into the top of each file to make sure contributors
# and forks are directed to the correct place.

status "Downloading missing queries from neovim-treesitter"

CLONE_DIR="$PWD/DerivedData/Clones"

rm -rf $CLONE_DIR
mkdir -p $CLONE_DIR

MISSING_QUERIES_URL="https://github.com/nvim-treesitter/nvim-treesitter"
MISSING_QUERIES_ROOT="queries"
LICENSE_NOTICE='; Copyright 2025 nvim-treesitter
;
; Licensed under the Apache License, Version 2.0 (the "License");
; you may not use this file except in compliance with the License.
; You may obtain a copy of the License at
;
;     http://www.apache.org/licenses/LICENSE-2.0
;
; Unless required by applicable law or agreed to in writing, software
; distributed under the License is distributed on an "AS IS" BASIS,
; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; See the License for the specific language governing permissions and
; limitations under the License.

'

git clone $MISSING_QUERIES_URL $CLONE_DIR &> $QUIET_OUTPUT

cd $CLONE_DIR
cd $MISSING_QUERIES_ROOT

for lang in $LIST ; do
    # remove prefix and convert to snake_case (replace - with _)
    lang_trim=${lang##*/}
    lang_trim="${lang_trim#tree-sitter-}"
    lang_trim=$(printf '%s' "$lang_trim" | tr '-' '_')

    TARGET_DIR="$RESOURCES_PATH/${lang##*/}"

    SRC_DIR="$PWD/$lang_trim"
    if [ ! -d "$SRC_DIR" ]; then
        continue
    fi

    # Find all scm query files and copy them into our resources folder where they don't already exist.
    find $SRC_DIR -type f -name "*.scm" | while IFS= read -r src_file; do
        filename=$(basename "$src_file")
        dest_file="$TARGET_DIR/$filename"

        if [ ! -e "$dest_file" ]; then
            echo "  Copying $dest_file" &> $QUIET_OUTPUT
            # copy the license notice into a header in the file
            echo "$LICENSE_NOTICE" > $dest_file
            cat $src_file >> $dest_file
        fi
    done
done

status "Missing queries successfully added!"

# cleanup derived derived data

cd $OLD_PWD

if [ -d "$PWD/DerivedData" ]; then
    status "Cleaning up DerivedData..."
    rm -rf "$PWD/DerivedData"
fi

status "Done!"
