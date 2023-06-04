# ``CodeEditLanguages/CodeLanguage``

## Overview

If the language required is known they can be accessed by using the type properties below.

```swift
let language = CodeLanguage.swift
```

If the language needs to be discovered by the file extension this can be done by calling ``detectLanguageFrom(url:)``.

```swift
let fileURL = URL(fileURLWithPath: "/path/to/file.swift")
let language = CodeLanguage.detectLanguageFrom(url: fileURL)
```

> Important: In case the language is not supported yet, the resulting ``CodeLanguage`` will be ``default`` (plain text).

### Supported Languages

- Bash
- C
- C++
- C#
- CSS
- Dart
- Dockerfile
- Elixir
- Go
- Go Mod
- Haskell
- HTML
- Java
- JavaScript
- JSON
- JSX
- Kotlin
- Lua
- Markdown
- Objective C
- OCaml / OCaml Interface
- PHP
- Python
- Ruby
- Rust
- Scala
- SQL
- Swift
- YAML
- Zig

## Topics

### Guides

- <doc:Add-Languages>

### Instance Properties

- ``id``
- ``tsName``
- ``extensions``
- ``parentQueryURL``
- ``tsName``
- ``queryURL``
- ``language``
- ``additionalHighlights``

### Type Properties

- ``allLanguages``
- ``default``
- ``bash``
- ``c``
- ``cpp``
- ``cSharp``
- ``css``
- ``dart``
- ``dockerfile``
- ``elixir``
- ``go``
- ``goMod``
- ``haskell``
- ``html``
- ``java``
- ``javascript``
- ``jsdoc``
- ``json``
- ``jsx``
- ``kotlin``
- ``lua``
- ``markdown``
- ``markdownInline``
- ``objc``
- ``php``
- ``python``
- ``ruby``
- ``rust``
- ``scala``
- ``sql``
- ``swift``
- ``yaml``
- ``zig``

### Type Methods

- ``detectLanguageFrom(url:)``
