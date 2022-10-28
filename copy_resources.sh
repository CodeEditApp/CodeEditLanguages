#!/usr/bin/env sh

CHECKOUTS_PATH="$PWD/DerivedData/SourcePackages/checkouts"
RESOURCES_PATH="$PWD/Sources/CodeEditLanguages/Resources"

rm -rf "$RESOURCES_PATH"

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
