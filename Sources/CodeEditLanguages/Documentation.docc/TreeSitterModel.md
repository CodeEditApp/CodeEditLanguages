# ``CodeEditLanguages/TreeSitterModel``

## Overview

Since fetching queries *can* be expensive the queries are fetched lazily and kept in memory for the entire session.

> Warning: Be aware that running the application in `Debug` configuration will lead to worse performance. Make sure to run it in `Release` configuration.

## Usage

```swift
let language = CodeLanguage.swift

// this call might be expensive
let query = TreeSitterModel.shared.query(for: language.id)
```
Or access it directly
```swift
// this call might be expensive
let query = TreeSitterModel.shared.swiftQuery
```

## Topics

### Type Properties

- ``shared``

### Instance Methods

- ``query(for:)``

### Instance Properties

- ``bashQuery``
- ``cQuery``
- ``cppQuery``
- ``cSharpQuery``
- ``cssQuery``
- ``dockerfileQuery``
- ``elixirQuery``
- ``goQuery``
- ``goModQuery``
- ``haskellQuery``
- ``htmlQuery``
- ``javaQuery``
- ``javascriptQuery``
- ``jsonQuery``
- ``jsxQuery``
- ``kotlinQuery``
- ``objcQuery``
- ``ocamlQuery``
- ``ocamlInterfaceQuery``
- ``phpQuery``
- ``pythonQuery``
- ``rubyQuery``
- ``rustQuery``
- ``sqlQuery``
- ``swiftQuery``
- ``yamlQuery``
- ``zigQuery``
