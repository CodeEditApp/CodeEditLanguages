# Update Languages

This article covers all the steps needed to update to the latest version of the `tree-sitter` languages.

## Overview

From time to time the `tree-sitter` languages need to be updated to their latest version. This is pretty straight forward and can be done in less than 5 minutes.

## Update the Dependencies

1. Open the `CodeLanguages-Container.xcodeproj` which is located inside the `./CodeLanguages-Container` directory.
   ![xcodeproj location](xcodeproj-location)

2. Go to `File > Packages > Update to Latest Package Versions` and let it resolve the SPM dependencies.
   > Note: Depending on your internet connection and Mac hardware this step can take a couple of minutes.

3. Close the project

> Tip: At this stage you can check if anything changed at all by checking the git status. If `Package.resolved` does not appear in the changed files list, you don't need to proceed.
> ```bash
> $ git status
> ```

## Update the Framework

1. Open your terminal and set your working directory
   ```bash
   $ cd path/to/CodeEditLanguages
   ```

2. Run the `build_framework.sh` script
   ```bash
   $ ./build_framework.sh
   ```
    > Note: To run the script, you need to install `jq` by downloading it [here](https://stedolan.github.io/jq/) or with Homebrew using:
    > ```bash
    > $ brew install jq
    > ```

   > Note: This script automatically removes old artifacts and replaces them with the new ones.

3. Check the console output. It should say `Done!` at the end.
   ![build output](build-output)
   > Tip: If you don't get the output and the script terminates early, there might be an issue. Try running the script again with the `--debug` flag appended:
   > ```bash
   > $ ./build_framework.sh --debug
   > ```

## Check if everything still works

1. Open the ``CodeEditLanguages`` Package in Xcode and run the included unit tests.

2. Once all the tests succeeded, the changes can be committed, pushed and a pull request can be opened.
