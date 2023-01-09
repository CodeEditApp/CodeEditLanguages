//
//  CodeLanguage.swift
//  CodeEditTextView/CodeLanguage
//
//  Created by Lukas Pistrol on 25.05.22.
//

import Foundation
import tree_sitter
import SwiftTreeSitter
import CodeLanguages_Container

/// A structure holding metadata for code languages
public struct CodeLanguage {
    private init(
        id: TreeSitterLanguage,
        tsName: String,
        extensions: Set<String>,
        parentURL: URL? = nil,
        highlights: Set<String>? = nil
    ) {
        self.id = id
        self.tsName = tsName
        self.extensions = extensions
        self.parentQueryURL = parentURL
        self.additionalHighlights = highlights
    }

    /// The ID of the language
    public let id: TreeSitterLanguage

    /// The display name of the language
    public let tsName: String

    /// A set of file extensions for the language
    ///
    /// In special cases this can also be a file name
    /// (e.g `Dockerfile`, `Makefile`)
    public let extensions: Set<String>

    /// The query URL of a language this language inherits from. (e.g.: C for C++)
    public let parentQueryURL: URL?

    /// Additional highlight file names (e.g.: JSX for JavaScript)
    public let additionalHighlights: Set<String>?

    /// The query URL for the language if available
    public var queryURL: URL? {
        queryURL()
    }

    /// The bundle's resource URL
    internal var resourceURL: URL? = Bundle.module.resourceURL

    /// The tree-sitter language for the language if available
    public var language: Language? {
        guard let tsLanguage = tsLanguage else { return nil }
        return Language(language: tsLanguage)
    }

    internal func queryURL(for highlights: String = "highlights") -> URL? {
        return resourceURL?
            .appendingPathComponent("Resources/tree-sitter-\(tsName)/\(highlights).scm")
    }

    /// Gets the TSLanguage from `tree-sitter`
    private var tsLanguage: UnsafeMutablePointer<TSLanguage>? {
        switch id {
        case .bash:
            return tree_sitter_bash()
        case .c:
            return tree_sitter_c()
        case .cpp:
            return tree_sitter_cpp()
        case .cSharp:
            return tree_sitter_c_sharp()
        case .css:
            return tree_sitter_css()
        case .dockerfile:
            return tree_sitter_dockerfile()
        case .elixir:
            return tree_sitter_elixir()
        case .go:
            return tree_sitter_go()
        case .goMod:
            return tree_sitter_gomod()
        case .haskell:
            return tree_sitter_haskell()
        case .html:
            return tree_sitter_html()
        case .java:
            return tree_sitter_java()
        case .javascript:
            return tree_sitter_javascript()
        case .json:
            return tree_sitter_json()
        case .jsx:
            return tree_sitter_javascript()
        case .php:
            return tree_sitter_php()
        case .python:
            return tree_sitter_python()
        case .ruby:
            return tree_sitter_ruby()
        case .rust:
            return tree_sitter_rust()
        case .swift:
            return tree_sitter_swift()
        case .yaml:
            return tree_sitter_yaml()
        case .zig:
            return tree_sitter_zig()
        case .plainText:
            return nil
        }
    }
}

public extension CodeLanguage {

    /// Gets the corresponding language for the given file URL
    ///
    /// Uses the `pathExtension` URL component to detect the language
    /// - Parameter url: The URL to get the language for.
    /// - Returns: A language structure
    static func detectLanguageFrom(url: URL) -> CodeLanguage {
        let fileExtension = url.pathExtension.lowercased()
        let fileName = url.pathComponents.last // should not be lowercase since it has to match e.g. `Dockerfile`
        // This is to handle special file types without an extension (e.g., Makefile, Dockerfile)
        let fileNameOrExtension = fileExtension.isEmpty ? (fileName != nil ? fileName! : "") : fileExtension
        if let lang = allLanguages.first(where: { lang in lang.extensions.contains(fileNameOrExtension)}) {
            return lang
        } else {
            return .default
        }
    }

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
        .php,
        .python,
        .ruby,
        .rust,
        .swift,
        .yaml,
        .zig
    ]

    /// A language structure for `Bash`
    static let bash: CodeLanguage = .init(id: .bash, tsName: "bash", extensions: ["sh"])

    /// A language structure for `C`
    static let c: CodeLanguage = .init(id: .c, tsName: "c", extensions: ["c", "h", "o"])

    /// A language structure for `C++`
    static let cpp: CodeLanguage = .init(id: .cpp,
                                         tsName: "cpp",
                                         extensions: ["cpp", "h", "cc"],
                                         parentURL: CodeLanguage.c.queryURL)

    /// A language structure for `C#`
    static let cSharp: CodeLanguage = .init(id: .cSharp, tsName: "c-sharp", extensions: ["cs"])

    /// A language structure for `CSS`
    static let css: CodeLanguage = .init(id: .css, tsName: "css", extensions: ["css"])

    /// A language structure for `Dockerfile`
    static let dockerfile: CodeLanguage = .init(id: .dockerfile, tsName: "dockerfile", extensions: ["Dockerfile"])

    /// A language structure for `Elixir`
    static let elixir: CodeLanguage = .init(id: .elixir, tsName: "elixir", extensions: ["ex", "exs"])

    /// A language structure for `Go`
    static let go: CodeLanguage = .init(id: .go, tsName: "go", extensions: ["go"])

    /// A language structure for `GoMod`
    static let goMod: CodeLanguage = .init(id: .goMod, tsName: "go-mod", extensions: ["mod"])

    /// A language structure for `Haskell`
    static let haskell: CodeLanguage = .init(id: .haskell, tsName: "haskell", extensions: ["hs"])

    /// A language structure for `HTML`
    static let html: CodeLanguage = .init(id: .html, tsName: "html", extensions: ["html", "htm"])

    /// A language structure for `Java`
    static let java: CodeLanguage = .init(id: .java, tsName: "java", extensions: ["java"])

    /// A language structure for `JavaScript`
    static let javascript: CodeLanguage = .init(id: .javascript, tsName: "javascript", extensions: ["js"])

    /// A language structure for `JSON`
    static let json: CodeLanguage = .init(id: .json, tsName: "json", extensions: ["json"])

    /// A language structure for `JSX`
    static let jsx: CodeLanguage = .init(id: .jsx,
                                         tsName: "javascript",
                                         extensions: ["jsx"],
                                         highlights: ["highlights-jsx"])

    /// A language structure for `PHP`
    static let php: CodeLanguage = .init(id: .php, tsName: "php", extensions: ["php"])

    /// A language structure for `Python`
    static let python: CodeLanguage = .init(id: .python, tsName: "python", extensions: ["py"])

    /// A language structure for `Ruby`
    static let ruby: CodeLanguage = .init(id: .ruby, tsName: "ruby", extensions: ["rb"])

    /// A language structure for `Rust`
    static let rust: CodeLanguage = .init(id: .rust, tsName: "rust", extensions: ["rs"])

    /// A language structure for `Swift`
    static let swift: CodeLanguage = .init(id: .swift, tsName: "swift", extensions: ["swift"])

    /// A language structure for `YAML`
    static let yaml: CodeLanguage = .init(id: .yaml, tsName: "yaml", extensions: ["yml", "yaml"])

    /// A language structure for `Zig`
    static let zig: CodeLanguage = .init(id: .zig, tsName: "zig", extensions: ["zig"])

    /// The default language (plain text)
    static let `default`: CodeLanguage = .init(id: .plainText, tsName: "Plain Text", extensions: ["txt"])
}
