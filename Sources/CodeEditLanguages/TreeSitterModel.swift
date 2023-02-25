//
//  TreeSitterModel.swift
//  CodeEditTextView/CodeLanguage
//
//  Created by Lukas Pistrol on 25.05.22.
//

import Foundation
import SwiftTreeSitter

/// A singleton class to manage `tree-sitter` queries and keep them in memory.
public class TreeSitterModel {

    /// The singleton/shared instance of ``TreeSitterModel``.
    public static let shared: TreeSitterModel = .init()

    /// Get a query for a specific language
    /// - Parameter language: The language to request the query for.
    /// - Returns: A Query if available. Returns `nil` for not implemented languages
    public func query(for language: TreeSitterLanguage) -> Query? {
        // swiftlint:disable:previous cyclomatic_complexity function_body_length
        switch language {
        case .bash:
            return bashQuery
        case .c:
            return cQuery
        case .cpp:
            return cppQuery
        case .cSharp:
            return cSharpQuery
        case .css:
            return cssQuery
        case .dockerfile:
            return dockerfileQuery
        case .elixir:
            return elixirQuery
        case .go:
            return goQuery
        case .goMod:
            return goModQuery
        case .haskell:
            return haskellQuery
        case .html:
            return htmlQuery
        case .java:
            return javaQuery
        case .javascript:
            return javascriptQuery
        case .json:
            return jsonQuery
        case .jsx:
            return jsxQuery
        case .kotlin:
            return kotlinQuery
        case .objc:
            return objcQuery
        case .ocaml:
            return ocamlQuery
        case .ocamlInterface:
            return ocamlInterfaceQuery
        case .php:
            return phpQuery
        case .python:
            return pythonQuery
        case .ruby:
            return rubyQuery
        case .rust:
            return rustQuery
        case .sql:
            return sqlQuery
        case .swift:
            return swiftQuery
        case .yaml:
            return yamlQuery
        case .zig:
            return zigQuery
        case .plainText:
            return nil
        }
    }

    /// Query for `Bash` files.
    public private(set) lazy var bashQuery: Query? = {
        return queryFor(.bash)
    }()

    /// Query for `C` files.
    public private(set) lazy var cQuery: Query? = {
        return queryFor(.c)
    }()

    /// Query for `C++` files.
    public private(set) lazy var cppQuery: Query? = {
        return queryFor(.cpp)
    }()

    /// Query for `C#` files.
    public private(set) lazy var cSharpQuery: Query? = {
        return queryFor(.cSharp)
    }()

    /// Query for `CSS` files.
    public private(set) lazy var cssQuery: Query? = {
        return queryFor(.css)
    }()

    /// Query for `Dockerfile` files.
    public private(set) lazy var dockerfileQuery: Query? = {
        return queryFor(.dockerfile)
    }()

    /// Query for `Elixir` files.
    public private(set) lazy var elixirQuery: Query? = {
        return queryFor(.elixir)
    }()

    /// Query for `Go` files.
    public private(set) lazy var goQuery: Query? = {
        return queryFor(.go)
    }()

    /// Query for `GoMod` files.
    public private(set) lazy var goModQuery: Query? = {
        return queryFor(.goMod)
    }()

    /// Query for `Haskell` files.
    public private(set) lazy var haskellQuery: Query? = {
        return queryFor(.haskell)
    }()

    /// Query for `HTML` files.
    public private(set) lazy var htmlQuery: Query? = {
        return queryFor(.html)
    }()

    /// Query for `Java` files.
    public private(set) lazy var javaQuery: Query? = {
        return queryFor(.java)
    }()

    /// Query for `JavaScript` files.
    public private(set) lazy var javascriptQuery: Query? = {
        return queryFor(.javascript)
    }()

    /// Query for `JSX` files.
    public private(set) lazy var jsxQuery: Query? = {
        return queryFor(.jsx)
    }()

    /// Query for `JSON` files.
    public private(set) lazy var jsonQuery: Query? = {
        return queryFor(.json)
    }()

    /// Query for `Kotlin` files.
    public private(set) lazy var kotlinQuery: Query? = {
        return queryFor(.kotlin)
    }()

    /// Query for `Objective C` files.
    public private(set) lazy var objcQuery: Query? = {
        return queryFor(.objc)
    }()

    /// Query for `OCaml` files.
    public private(set) lazy var ocamlQuery: Query? = {
        return queryFor(.ocaml)
    }()

    /// Query for `OCaml Interface` files.
    public private(set) lazy var ocamlInterfaceQuery: Query? = {
        return queryFor(.ocamlInterface)
    }()

    /// Query for `PHP` files.
    public private(set) lazy var phpQuery: Query? = {
        return queryFor(.php)
    }()

    /// Query for `Python` files.
    public private(set) lazy var pythonQuery: Query? = {
        return queryFor(.python)
    }()

    /// Query for `Ruby` files.
    public private(set) lazy var rubyQuery: Query? = {
        return queryFor(.ruby)
    }()

    /// Query for `Rust` files.
    public private(set) lazy var rustQuery: Query? = {
        return queryFor(.rust)
    }()

    /// Query for `SQL` files.
    public private(set) lazy var sqlQuery: Query? = {
        return queryFor(.sql)
    }()

    /// Query for `Swift` files.
    public private(set) lazy var swiftQuery: Query? = {
        return queryFor(.swift)
    }()

    /// Query for `YAML` files.
    public private(set) lazy var yamlQuery: Query? = {
        return queryFor(.yaml)
    }()

    /// Query for `Zig` files.
    public private(set) lazy var zigQuery: Query? = {
        return queryFor(.zig)
    }()

    private func queryFor(_ codeLanguage: CodeLanguage) -> Query? {
        // get the tree-sitter language and query url if available
        guard let language = codeLanguage.language,
              let url = codeLanguage.queryURL else { return nil }

        // 1. if the language depends on another language combine the query files
        // 2. if the language has additional query files combine them with the main one
        // 3. otherwise return the query file
        if let parentURL = codeLanguage.parentQueryURL,
           let data = combinedQueryData(for: [url, parentURL]) {
            return try? Query(language: language, data: data)
        } else if let additionalHighlights = codeLanguage.additionalHighlights {
            var addURLs = additionalHighlights.compactMap({ codeLanguage.queryURL(for: $0) })
            addURLs.append(url)
            guard let data = combinedQueryData(for: addURLs) else { return nil }
            return try? Query(language: language, data: data)
        } else {
            return try? language.query(contentsOf: url)
        }
    }

    private func combinedQueryData(for fileURLs: [URL]) -> Data? {
        let rawQuery = fileURLs.compactMap { try? String(contentsOf: $0) }.joined(separator: "\n")
        if !rawQuery.isEmpty {
            return rawQuery.data(using: .utf8)
        } else {
            return nil
        }
    }

    private init() {}
}
