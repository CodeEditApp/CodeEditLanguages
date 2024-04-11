// swiftlint:disable file_length

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
        .agda,
        .bash,
        .c,
        .cpp,
        .cSharp,
        .css,
        .dart,
        .dockerfile,
        .elixir,
        .go,
        .goMod,
        .haskell,
        .html,
        .java,
        .javascript,
        .jsdoc,
        .json,
        .jsx,
        .julia,
        .kotlin,
        .lua,
        .markdown,
        .markdownInline,
        .objc,
        .ocaml,
        .ocamlInterface,
        .perl,
        .php,
        .python,
        .regex,
        .ruby,
        .rust,
        .scala,
        .sql,
        .swift,
        .toml,
        .tsx,
        .typescript,
        .verilog,
        .yaml,
        .zig
    ]

    /// A language structure for `Agda`
    static let agda: CodeLanguage = .init(
        id: .agda,
        tsName: "agda",
        extensions: ["agda"],
        lineCommentString: "--",
        rangeCommentStrings: ("{-", "-}")
    )

    /// A language structure for `Bash`
    static let bash: CodeLanguage = .init(
        id: .bash,
        tsName: "bash",
        extensions: ["sh", "bash"],
        lineCommentString: "#",
        rangeCommentStrings: (":'", "'")
    )

    /// A language structure for `C`
    static let c: CodeLanguage = .init(
        id: .c,
        tsName: "c",
        extensions: ["c", "h"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `C++`
    static let cpp: CodeLanguage = .init(
        id: .cpp,
        tsName: "cpp",
        extensions: ["cc", "cpp", "c++", "hpp", "h"],
        lineCommentString: CodeLanguage.c.lineCommentString,
        rangeCommentStrings: CodeLanguage.c.rangeCommentStrings,
        documentationCommentStrings: [.pair(("/**", "*/"))],
        parentURL: CodeLanguage.c.queryURL,
        highlights: ["injections"]
    )

    /// A language structure for `C#`
    static let cSharp: CodeLanguage = .init(
        id: .cSharp,
        tsName: "c-sharp",
        extensions: ["cs"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `CSS`
    static let css: CodeLanguage = .init(
        id: .css,
        tsName: "css",
        extensions: ["css"],
        lineCommentString: "",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `Dart`
    static let dart: CodeLanguage = .init(
        id: .dart,
        tsName: "dart",
        extensions: ["dart"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `Dockerfile`
    static let dockerfile: CodeLanguage = .init(
        id: .dockerfile,
        tsName: "dockerfile",
        extensions: ["Dockerfile"],
        lineCommentString: "#",
        rangeCommentStrings: ("", "")
    )

    /// A language structure for `Elixir`
    static let elixir: CodeLanguage = .init(
        id: .elixir,
        tsName: "elixir",
        extensions: ["ex", "exs"],
        lineCommentString: "#",
        rangeCommentStrings: ("", ""),
        documentationCommentStrings: [.pair(("\"\"\"", "\"\"\""))],
        highlights: ["injections"]
    )

    /// A language structure for `Go`
    static let go: CodeLanguage = .init(
        id: .go,
        tsName: "go",
        extensions: ["go"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `GoMod`
    static let goMod: CodeLanguage = .init(
        id: .goMod,
        tsName: "go-mod",
        extensions: ["mod"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `Haskell`
    static let haskell: CodeLanguage = .init(
        id: .haskell,
        tsName: "haskell",
        extensions: ["hs"],
        lineCommentString: "--",
        rangeCommentStrings: ("{-", "-}")
    )

    /// A language structure for `HTML`
    static let html: CodeLanguage = .init(
        id: .html,
        tsName: "html",
        extensions: ["html", "htm", "shtml"],
        lineCommentString: "",
        rangeCommentStrings: ("<!--", "-->"),
        highlights: ["injections"]
    )

    /// A language structure for `Java`
    static let java: CodeLanguage = .init(
        id: .java,
        tsName: "java",
        extensions: ["java", "jav"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/"),
        documentationCommentStrings: [.pair(("/**", "*/"))]
    )

    /// A language structure for `JavaScript`
    static let javascript: CodeLanguage = .init(
        id: .javascript,
        tsName: "javascript",
        extensions: ["js", "cjs", "mjs"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/"),
        documentationCommentStrings: [.pair(("/**", "*/"))],
        highlights: ["injections"],
        additionalIdentifiers: ["node", "deno"]
    )

    /// A language structure for `JSDoc`
    static let jsdoc: CodeLanguage = .init(
        id: .jsdoc,
        tsName: "jsdoc",
        extensions: [],
        lineCommentString: "",
        rangeCommentStrings: ("/**", "*/")
    )

    /// A language structure for `JSON`
    static let json: CodeLanguage = .init(
        id: .json,
        tsName: "json",
        extensions: ["json"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `JSX`
    static let jsx: CodeLanguage = .init(
        id: .jsx,
        tsName: "javascript",
        extensions: ["jsx"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/"),
        highlights: ["highlights-jsx", "injections"]
    )

    /// A language structure for `Julia`
    static let julia: CodeLanguage = .init(
        id: .julia,
        tsName: "julia",
        extensions: ["jl"],
        lineCommentString: "#",
        rangeCommentStrings: ("#=", "=#")
    )

    /// A language structure for `Kotlin`
    static let kotlin: CodeLanguage = .init(
        id: .kotlin,
        tsName: "kotlin",
        extensions: ["kt", "kts"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `Lua`
    static let lua: CodeLanguage = .init(
        id: .lua,
        tsName: "lua",
        extensions: ["lua"],
        lineCommentString: "--",
        rangeCommentStrings: ("-[[", "]]--"),
        highlights: ["injections"]
    )

    /// A language structure for `Markdown`
    static let markdown: CodeLanguage = .init(
        id: .markdown,
        tsName: "markdown",
        extensions: ["md", "mkd", "mkdn", "mdwn", "mdown", "markdown"],
        lineCommentString: "[comment]: #",
        rangeCommentStrings: ("", ""),
        highlights: ["injections"]
    )

    /// A language structure for `Markdown Inline`
    static let markdownInline: CodeLanguage = .init(
        id: .markdownInline,
        tsName: "markdown-inline",
        extensions: [],
        lineCommentString: "",
        rangeCommentStrings: ("", ""),
        highlights: ["injections"]
    )

    /// A language structure for `Objective C`
    static let objc: CodeLanguage = .init(
        id: .objc,
        tsName: "objc",
        extensions: ["m", "h"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `OCaml`
    static let ocaml: CodeLanguage = .init(
        id: .ocaml,
        tsName: "ocaml",
        extensions: ["ml"],
        lineCommentString: "",
        rangeCommentStrings: ("(*", "*)"),
        documentationCommentStrings: [.pair(("(**", "*)"))]
    )

    /// A language structure for `OCaml Interface`
    static let ocamlInterface: CodeLanguage = .init(
        id: .ocamlInterface,
        tsName: "ocaml",
        extensions: ["mli"],
        lineCommentString: "",
        rangeCommentStrings: ("", "")
    )

    /// A language structure for `Perl`
    static let perl: CodeLanguage = .init(
        id: .perl,
        tsName: "perl",
        extensions: ["pl", "pm"],
        lineCommentString: "#",
        rangeCommentStrings: ("=pod", "=cut")
    )

    /// A language structure for `PHP`
    static let php: CodeLanguage = .init(
        id: .php,
        tsName: "php",
        extensions: ["php"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/"),
        highlights: ["injections"]
    )

    /// A language structure for `Python`
    static let python: CodeLanguage = .init(
        id: .python,
        tsName: "python",
        extensions: ["py"],
        lineCommentString: "#",
        rangeCommentStrings: ("", ""),
        documentationCommentStrings: [.pair(("\"\"\"", "\"\"\""))],
        additionalIdentifiers: ["python2", "python3"]
    )

    /// A language structure for `Regex`
    static let regex: CodeLanguage = .init(
        id: .regex,
        tsName: "regex",
        extensions: [],
        lineCommentString: "",
        rangeCommentStrings: ("", "")
    )

    /// A language structure for `Ruby`
    static let ruby: CodeLanguage = .init(
        id: .ruby,
        tsName: "ruby",
        extensions: ["rb"],
        lineCommentString: "#",
        rangeCommentStrings: ("=begin", "=end")
    )

    /// A language structure for `Rust`
    static let rust: CodeLanguage = .init(
        id: .rust,
        tsName: "rust",
        extensions: ["rs"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/"),
        documentationCommentStrings: [
            .single("///"),
            .single("//!"),
            .pair(("/**", "*/")),
            .pair(("/*!", "*/"))
        ],
        highlights: ["injections"]
    )

    /// A language structure for `Scala`
    static let scala: CodeLanguage = .init(
        id: .scala,
        tsName: "scala",
        extensions: ["scala", "sc"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `SQL`
    static let sql: CodeLanguage = .init(
        id: .sql,
        tsName: "sql",
        extensions: ["sql"],
        lineCommentString: "--",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `Swift`
    static let swift: CodeLanguage = .init(
        id: .swift,
        tsName: "swift",
        extensions: ["swift"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/"),
        documentationCommentStrings: [.single("///"), .pair(("/**", "*/"))]
    )

    /// A language structure for `TOML`
    static let toml: CodeLanguage = .init(
        id: .toml,
        tsName: "toml",
        extensions: ["toml"],
        lineCommentString: "#",
        rangeCommentStrings: ("", "")
    )

    /// A language structure for `TSX`
    static let tsx: CodeLanguage = .init(
        id: .tsx,
        tsName: "typescript",
        extensions: ["tsx"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/"),
        parentURL: CodeLanguage.jsx.queryURL
    )

    /// A language structure for `Typescript`
    static let typescript: CodeLanguage = .init(
        id: .typescript,
        tsName: "typescript",
        extensions: ["ts", "cts", "mts"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/"),
        parentURL: CodeLanguage.javascript.queryURL
    )

    /// A language structure for `Verilog`
    static let verilog: CodeLanguage = .init(
        id: .verilog,
        tsName: "verilog",
        extensions: ["v"],
        lineCommentString: "//",
        rangeCommentStrings: ("/*", "*/")
    )

    /// A language structure for `YAML`
    static let yaml: CodeLanguage = .init(
        id: .yaml,
        tsName: "yaml",
        extensions: ["yml", "yaml"],
        lineCommentString: "#",
        rangeCommentStrings: ("", "")
    )

    /// A language structure for `Zig`
    static let zig: CodeLanguage = .init(
        id: .zig,
        tsName: "zig",
        extensions: ["zig"],
        lineCommentString: "//",
        rangeCommentStrings: ("", ""),
        documentationCommentStrings: [.single("///"), .single("//!")],
        highlights: ["injections"]
    )

    /// The default language (plain text)
    static let `default`: CodeLanguage = .init(
        id: .plainText,
        tsName: "PlainText",
        extensions: ["txt"],
        lineCommentString: "",
        rangeCommentStrings: ("", "")
    )
}

// swiftlint:enable file_length
