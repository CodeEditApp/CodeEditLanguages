//
//  CodeEditLanguages_Tests.swift
//  
//
//  Created by Lukas Pistrol on 28.10.22.
//

import XCTest
@testable import CodeEditLanguages
import SwiftTreeSitter

// swiftlint:disable all
final class CodeEditLanguagesTests: XCTestCase {

    let bundleURL = Bundle.module.resourceURL

// MARK: - Bash

    func test_CodeLanguageBash() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.sh")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .bash)
    }

    func test_FetchQueryBash() throws {
        var language = CodeLanguage.bash
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - C

    func test_CodeLanguageC() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.c")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .c)
    }

    func test_CodeLanguageC2() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.o")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .c)
    }

    func test_CodeLanguageC3() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.h")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .c)
    }

    func test_FetchQueryC() throws {
        var language = CodeLanguage.c
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - C++

    func test_CodeLanguageCPP() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.cc")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .cpp)
    }

    func test_CodeLanguageCPP2() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.cpp")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .cpp)
    }

    func test_CodeLanguageCPP3() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.hpp")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .cpp)
    }

    func test_FetchQueryCPP() throws {
        var language = CodeLanguage.cpp
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - C#

    func test_CodeLanguageCSharp() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.cs")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .cSharp)
    }

    func test_FetchQueryCSharp() throws {
        var language = CodeLanguage.cSharp
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - CSS

    func test_CodeLanguageCSS() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.css")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .css)
    }

    func test_FetchQueryCSS() throws {
        var language = CodeLanguage.css
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - CSS

    func test_CodeLanguageDart() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.dart")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .dart)
    }

    func test_FetchQueryDart() throws {
        var language = CodeLanguage.dart
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Dockerfile

    func test_CodeLanguageDockerfile() throws {
        let url = URL(fileURLWithPath: "~/path/to/Dockerfile")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .dockerfile)
    }

    func test_FetchQueryDockerfile() throws {
        var language = CodeLanguage.dockerfile
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Elixir

    func test_CodeLanguageElixir() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.ex")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .elixir)
    }

    func test_CodeLanguageElixir2() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.exs")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .elixir)
    }

    func test_FetchQueryElixir() throws {
        var language = CodeLanguage.elixir
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Go

    func test_CodeLanguageGo() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.go")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .go)
    }

    func test_FetchQueryGo() throws {
        var language = CodeLanguage.go
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Go Mod

    func test_CodeLanguageGoMod() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.mod")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .goMod)
    }

    func test_FetchQueryGoMod() throws {
        var language = CodeLanguage.goMod
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Haskell

    func test_CodeLanguageHaskell() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.hs")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .haskell)
    }

    func test_FetchQueryHaskell() throws {
        var language = CodeLanguage.haskell
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - HTML

    func test_CodeLanguageHTML() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.html")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .html)
    }

    func test_CodeLanguageHTML2() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.htm")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .html)
    }

    func test_FetchQueryHTML() throws {
        var language = CodeLanguage.html
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Java

    func test_CodeLanguageJava() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.java")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .java)
    }

    func test_CodeLanguageJava2() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.jav")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .java)
    }

    func test_FetchQueryJava() throws {
        var language = CodeLanguage.java
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - JavaScript

    func test_CodeLanguageJavaScript() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.js")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .javascript)
    }

    func test_FetchQueryJavaScript() throws {
        var language = CodeLanguage.javascript
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - JSON

    func test_CodeLanguageJSON() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.json")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .json)
    }

    func test_FetchQueryJSON() throws {
        var language = CodeLanguage.json
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - JSX

    func test_CodeLanguageJSX() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.jsx")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .jsx)
    }

    func test_FetchQueryJSX() throws {
        var language = CodeLanguage.jsx
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Kotlin

    func test_CodeLanguageKotlin() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.kt")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .kotlin)
    }

    func test_CodeLanguageKotlin2() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.kts")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .kotlin)
    }

    func test_FetchQueryKotlin() throws {
        var language = CodeLanguage.kotlin
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

    // MARK: - Lua

    func test_CodeLanguageLua() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.lua")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .lua)
    }

    func test_FetchQueryLua() throws {
        var language = CodeLanguage.lua
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Objective C

    func test_CodeLanguageObjC() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.m")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .objc)
    }

    func test_FetchQueryObjC() throws {
        var language = CodeLanguage.objc
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }
    
// MARK: - OCaml
    func test_CodeLanguageOCaml() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.ml")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .ocaml)
    }

    func test_FetchQueryOCaml() throws {
        var language = CodeLanguage.ocaml
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }
    
// MARK: - OCaml Interface
    func test_CodeLanguageOCamlInterface() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.mli")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .ocamlInterface)
    }

    func test_FetchQueryOCamlInterface() throws {
        var language = CodeLanguage.ocamlInterface
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }
    
// MARK: - PHP

    func test_CodeLanguagePHP() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.php")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .php)
    }

    func test_FetchQueryPHP() throws {
        var language = CodeLanguage.php
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Python

    func test_CodeLanguagePython() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.py")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .python)
    }

    func test_FetchQueryPython() throws {
        var language = CodeLanguage.python
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Ruby

    func test_CodeLanguageRuby() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.rb")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .ruby)
    }

    func test_FetchQueryRuby() throws {
        var language = CodeLanguage.ruby
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Rust

    func test_CodeLanguageRust() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.rs")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .rust)
    }

    func test_FetchQueryRust() throws {
        var language = CodeLanguage.rust
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

    // MARK: - SQL

    func test_CodeLanguageSQL() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.sql")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .sql)
    }

    func test_FetchQuerySQL() throws {
        var language = CodeLanguage.sql
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Swift

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

// MARK: - YAML

    func test_CodeLanguageYAML() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.yml")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .yaml)
    }

    func test_CodeLanguageYAML2() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.yaml")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .yaml)
    }

    func test_FetchQueryYAML() throws {
        var language = CodeLanguage.yaml
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Zig

    func test_CodeLanguageZig() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.zig")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .zig)
    }

    func test_FetchQueryZig() throws {
        var language = CodeLanguage.zig
        language.resourceURL = bundleURL

        let data = try Data(contentsOf: language.queryURL!)
        let query = try? Query(language: language.language!, data: data)
        XCTAssertNotNil(query)
        XCTAssertNotEqual(query?.patternCount, 0)
    }

// MARK: - Unsupported

    func test_CodeLanguageUnsupported() throws {
        let url = URL(fileURLWithPath: "~/path/to/file.abc")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .plainText)
    }

    func test_CodeLanguageUnsupportedNoExtension() throws {
        let url = URL(fileURLWithPath: "~/path/to/file")
        let language = CodeLanguage.detectLanguageFrom(url: url)

        XCTAssertEqual(language.id, .plainText)
    }

}
