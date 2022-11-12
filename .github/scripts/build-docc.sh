#!/bin/bash

xcodebuild clean docbuild -scheme CodeEditLanguages \
    -destination generic/platform=macos \
    OTHER_DOCC_FLAGS="--transform-for-static-hosting --hosting-base-path CodeEditLanguages --output-path ./docs"