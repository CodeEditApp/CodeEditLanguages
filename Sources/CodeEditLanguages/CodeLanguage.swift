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
    internal init(
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
        case .dart:
            return tree_sitter_dart()
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
        case .kotlin:
            return tree_sitter_kotlin()
        case .lua:
            return tree_sitter_lua()
        case .objc:
            return tree_sitter_objc()
        case .ocaml:
            return tree_sitter_ocaml()
        case .ocamlInterface:
            return tree_sitter_ocaml_interface()
        case .php:
            return tree_sitter_php()
        case .python:
            return tree_sitter_python()
        case .regex:
            return tree_sitter_regex()
        case .ruby:
            return tree_sitter_ruby()
        case .rust:
            return tree_sitter_rust()
        case .scala:
            return tree_sitter_scala()
        case .sql:
            return tree_sitter_sql()
        case .swift:
            return tree_sitter_swift()
        case .tsx:
            return tree_sitter_tsx()
        case .typescript:
            return tree_sitter_typescript()
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
}
