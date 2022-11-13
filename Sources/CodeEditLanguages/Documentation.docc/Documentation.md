# ``CodeEditLanguages``

A collection of `tree-sitter` languages for syntax highlighting.

## Overview

![logo](codeeditlanguages-logo)

This package includes a binary framework `CodeLanguagesContainer.xcframework` which bundles all `tree-sitter` languages in a single binary to greatly reduce SPM package resolution times.

The languages are then served as a ``CodeLanguage``.

## SwiftTreeSitter

This package heavily depends on [SwiftTreeSitter](https://github.com/ChimeHQ/SwiftTreeSitter) by [Matt Massicotte](https://twitter.com/mattie).

## Topics

### Guides

- <doc:Add-Languages>
- <doc:Update-Languages>

### Structs

- ``CodeEditLanguages/CodeLanguage``

### Classes

- ``CodeEditLanguages/TreeSitterModel``

### Enums

- ``CodeEditLanguages/TreeSitterLanguage``
