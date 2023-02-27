//
//  CodeLanguage+Definitions.swift
//  
//
//  Created by Lukas Pistrol on 15.01.23.
//

import Foundation

public extension CodeLanguage {

    /// An array of all language structures.
    static let allLanguages: [CodeLanguage] = [
        .bash,
        .c,
        .cpp,
        .cSharp,
        .css,
        .dockerfile,
        .elixir,
        .go,
        .goMod,
        .haskell,
        .html,
        .java,
        .javascript,
        .json,
        .jsx,
        .kotlin,
        .lua,
        .objc,
        .ocaml,
        .ocamlInterface,
        .php,
        .python,
        .ruby,
        .rust,
        .sql,
        .swift,
        .yaml,
        .zig
    ]

    /// A language structure for `Bash`
    static let bash: CodeLanguage = .init(
        id: .bash,
        tsName: "bash",
        extensions: ["sh"]
    )

    /// A language structure for `C`
    static let c: CodeLanguage = .init(
        id: .c,
        tsName: "c",
        extensions: ["c", "h", "o"]
    )

    /// A language structure for `C++`
    static let cpp: CodeLanguage = .init(
        id: .cpp,
        tsName: "cpp",
        extensions: ["cpp", "h", "hpp", "cc"],
        parentURL: CodeLanguage.c.queryURL,
        highlights: ["injections"]
    )

    /// A language structure for `C#`
    static let cSharp: CodeLanguage = .init(
        id: .cSharp,
        tsName: "c-sharp",
        extensions: ["cs"]
    )

    /// A language structure for `CSS`
    static let css: CodeLanguage = .init(
        id: .css,
        tsName: "css",
        extensions: ["css"]
    )

    /// A language structure for `Dockerfile`
    static let dockerfile: CodeLanguage = .init(
        id: .dockerfile,
        tsName: "dockerfile",
        extensions: ["Dockerfile"]
    )

    /// A language structure for `Elixir`
    static let elixir: CodeLanguage = .init(
        id: .elixir,
        tsName: "elixir",
        extensions: ["ex", "exs"],
        highlights: ["injections"]
    )

    /// A language structure for `Go`
    static let go: CodeLanguage = .init(
        id: .go,
        tsName: "go",
        extensions: ["go"]
    )

    /// A language structure for `GoMod`
    static let goMod: CodeLanguage = .init(
        id: .goMod,
        tsName: "go-mod",
        extensions: ["mod"]
    )

    /// A language structure for `Haskell`
    static let haskell: CodeLanguage = .init(
        id: .haskell,
        tsName: "haskell",
        extensions: ["hs"]
    )

    /// A language structure for `HTML`
    static let html: CodeLanguage = .init(
        id: .html,
        tsName: "html",
        extensions: ["html", "htm"],
        highlights: ["injections"]
    )

    /// A language structure for `Java`
    static let java: CodeLanguage = .init(
        id: .java,
        tsName: "java",
        extensions: ["java", "jav"]
    )

    /// A language structure for `JavaScript`
    static let javascript: CodeLanguage = .init(
        id: .javascript,
        tsName: "javascript",
        extensions: ["js"],
        highlights: ["injections"]
    )

    /// A language structure for `JSON`
    static let json: CodeLanguage = .init(
        id: .json,
        tsName: "json",
        extensions: ["json"]
    )

    /// A language structure for `JSX`
    static let jsx: CodeLanguage = .init(
        id: .jsx,
        tsName: "javascript",
        extensions: ["jsx"],
        highlights: ["highlights-jsx", "injections"]
    )

    /// A language structure for `Kotlin`
    static let kotlin: CodeLanguage = .init(
        id: .kotlin,
        tsName: "kotlin",
        extensions: ["kt", "kts"]
    )

    /// A language structure for `Lua`
    static let lua: CodeLanguage = .init(
        id: .lua,
        tsName: "lua",
        extensions: ["lua"],
        highlights: ["injections"]
    )

    /// A language structure for `Objective C`
    static let objc: CodeLanguage = .init(
        id: .objc,
        tsName: "objc",
        extensions: ["m"]
    )

    /// A language structure for `OCaml`
    static let ocaml: CodeLanguage = .init(
        id: .ocaml,
        tsName: "ocaml",
        extensions: ["ml"]
    )

    /// A language structure for `OCaml Interface`
    static let ocamlInterface: CodeLanguage = .init(
        id: .ocamlInterface,
        tsName: "ocaml",
        extensions: ["mli"]
    )

    /// A language structure for `PHP`
    static let php: CodeLanguage = .init(
        id: .php,
        tsName: "php",
        extensions: ["php"],
        highlights: ["injections"]
    )

    /// A language structure for `Python`
    static let python: CodeLanguage = .init(
        id: .python,
        tsName: "python",
        extensions: ["py"]
    )

    /// A language structure for `Ruby`
    static let ruby: CodeLanguage = .init(
        id: .ruby,
        tsName: "ruby",
        extensions: ["rb"]
    )

    /// A language structure for `Rust`
    static let rust: CodeLanguage = .init(
        id: .rust,
        tsName: "rust",
        extensions: ["rs"],
        highlights: ["injections"]
    )

    /// A language structure for `SQL`
    static let sql: CodeLanguage = .init(
        id: .sql,
        tsName: "sql",
        extensions: ["sql"]
    )

    /// A language structure for `Swift`
    static let swift: CodeLanguage = .init(
        id: .swift,
        tsName: "swift",
        extensions: ["swift"]
    )

    /// A language structure for `YAML`
    static let yaml: CodeLanguage = .init(
        id: .yaml,
        tsName: "yaml",
        extensions: ["yml", "yaml"]
    )

    /// A language structure for `Zig`
    static let zig: CodeLanguage = .init(
        id: .zig,
        tsName: "zig",
        extensions: ["zig"],
        highlights: ["injections"]
    )

    /// The default language (plain text)
    static let `default`: CodeLanguage = .init(
        id: .plainText,
        tsName: "PlainText",
        extensions: ["txt"]
    )
}
