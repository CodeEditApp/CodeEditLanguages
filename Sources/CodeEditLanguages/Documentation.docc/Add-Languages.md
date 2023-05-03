# Add Languages

This article is a writedown on how to add support for more languages to ``CodeLanguage``.

## Overview

First of all have a look at the corresponding [GitHub Issue](https://github.com/CodeEditApp/CodeEditTextView/issues/15) to see which languages still need implementation.

> Note: If you want to update existing languages see <doc:Update-Languages> instead.

## Add SPM support

If you find one you want to add, fork and clone the linked repo and create a new branch `feature/spm`.

> Tip: In the following code samples replace `{LANG}` or `{lang}` with the language you add (e.g.: `Swift` or `CPP` and `swift` or `cpp` respectively)

### .gitignore

Edit the `.gitignore` file to exclude the `.build/` directory from git.

### Package.swift

Create a new file `Package.swift` in the `root` directory of the repository and add the following configuration.

> Warning: Make sure to remove the comment in 'sources'.

```swift
// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitter{LANG}",
    platforms: [.macOS(.v10_13), .iOS(.v11)],
    products: [
        .library(name: "TreeSitter{LANG}", targets: ["TreeSitter{LANG}"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "TreeSitter{LANG}",
                path: ".",
                exclude: [
                    "binding.gyp",
                    "bindings",
                    "Cargo.toml",
                    "corpus",
                    "examples",
                    "grammar.js",
                    "LICENSE",
                    "Makefile",
                    "package.json",
                    "README.md",
                    "src/grammar.json",
                    "src/node-types.json",
                    // any additional files to exclude 
                ],
                sources: [
                    "src/parser.c",
                    "src/scanner.cc", // this might be `scanner.c` or not present at all
                ],
                resources: [
                    .copy("queries")
                ],
                publicHeadersPath: "bindings/swift",
                cSettings: [.headerSearchPath("src")])
    ]
)
```

### Swift Bindings

Now you need to create the Swift bindings which are a `header` file exposing the `tree_sitter_{lang}()` function.

First of all create the following directories inside the `bindings/` directory:

`./bindings/swift/TreeSitter{LANG}/`

Inside that folder create a new header file called `{lang}.h`.

```cpp
#ifndef TREE_SITTER_{LANG}_H_
#define TREE_SITTER_{LANG}_H_

typedef struct TSLanguage TSLanguage;

#ifdef __cplusplus
extern "C" {
#endif

extern TSLanguage *tree_sitter_{lang}();

#ifdef __cplusplus
}
#endif

#endif // TREE_SITTER_{LANG}_H_
```

## Add it to CodeEditLanguages

In order to add a language to ``CodeEditLanguages`` you need to open the `.xcodeproj` file located inside `CodeLanguage-Container`.

![.xcodeproj location](xcodeproj-location)

1. Add the `tree-sitter` package you created earlier as a dependency like you would in a regular Xcode project.

2. Then make sure the framework target loads the package module.

3. Now open the `CodeLanguages_Container.h` header file and add:

    ```cpp
    extern TSLanguage *tree_sitter_{lang}();
    ```

    > Important: Please keep an alphabetical order

4. Now create the `xcframework` by running the `build_framework.sh` script from the Package's root directory.
   ```bash
   $ ./build_framework.sh
   ```
    > Note: To run the script, you need to install `jq` by downloading it [here](https://stedolan.github.io/jq/) or with Homebrew using:
    > ```bash
    > $ brew install jq
    > ```

5. Check the output of the script. It should say `Done!` at the end.
   ![build_framework.sh console output](build-output)
   > Tip: If this does not succeed, try running the script using the `--debug` flag to get verbose output:
   > ```bash
   > $ ./build_framework.sh --debug
   > ```

6. You are now done in the Xcode Project and may close it now. Open the Package and continue.

## Add it to CodeLanguage

Now move over to the `Sources/CodeEditLanguages` folder where 3 files need to be updated.

### TreeSitterLanguage.swift

Add a case for your language to ``TreeSitterLanguage``:

```swift
public enum TreeSitterLanguage: String {
    // other cases
    case {lang}
}
```

### CodeLanguage.swift

Find the `tsLanguage` computed property and add a `case` to it:

```swift
private var tsLanguage: UnsafeMutablePointer<TSLanguage>? {
    switch id {
    // other cases
    case .{lang}:
        return tree_sitter_{lang}()
    }
    // other cases
}
```

On the bottom of the file add a new `static` constant:

```swift
static let {lang}: CodeLanguage = .init(
    id: .{lang}, 
    tsName: {lang}, 
    extensions: [...]
)
```

> Important: in 'extensions' add the proper file extensions your language uses.

Now find the static constant ``CodeLanguage/allLanguages`` and add your language to it:

```swift
static let allLanguages: [CodeLanguage] = [
    // other languages
    .{lang},
    // other languages
]
```

### TreeSitterModel.swift

Create a new query like so:

```swift
public private(set) lazy var {lang}Query: Query? = {
    return queryFor(.{lang})
}()
```

Find the ``TreeSitterModel/query(for:)`` method and add a `case` for your language:

```swift
public func query(for language: TreeSitterLanguage) -> Query? {
    switch language {
    // other cases
    case .{lang}:
        return {lang}Query
    // other cases
    }
}
```

## Test it!

Make sure to test the newly created language in a sample project!

When everything is working correctly push your `tree-sitter-{lang}` changes to `origin` and also create a Pull Request to the official repository.

> Tip: Take [this PR description](https://github.com/tree-sitter/tree-sitter-javascript/pull/223) as a template and cross-reference it with your Pull Request.

Now you can remove the local dependencies and replace it with the actual package URLs and submit a Pull Request for `CodeEditTextView`.

## Unit Tests

Also make sure to add test cases for your new language in `Tests/CodeEditLanguagesTests`.

### Example

```swift
// MARK: - Swift

    // create as many test cases as there are file extensions
    func test_CodeLanguageSwift() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.swift")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .swift)
    }

    func test_FetchQuerySwift() throws {
        var language = CodeLanguage.swift
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }
```

### Run Tests locally

Once you added your unit test cases run all tests locally on your machine by going to `Product>Test` or pressing `⌘+U` to make sure everything is working as intended.
![unit test results](tests-results)

## Documentation

Please make sure to add the newly created properties to the documentation `*.md` files in the `Documentation.docc` catalog.
![docs location](docs-location)
