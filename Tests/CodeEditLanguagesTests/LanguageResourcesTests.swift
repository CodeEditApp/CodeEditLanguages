//
//  LanguageResourcesTests.swift
//  CodeEditLanguages
//
//  Created by Khan Winter on 6/6/25.
//

import XCTest
@testable import CodeEditLanguages

final class LanguageResourcesTests: XCTestCase {
    /// Look at each language and do two checks:
    /// - All files bundled in the final product are referenced by the ``CodeLanguage.additionalHighlights`` set. If
    ///   there's missing files, we raise a warning. This is useful for ensuring we aren't accidentally missing
    ///   injections or tags if they're available. Some languages have some odd highlights though so it's a logged
    ///   warning.
    /// - All files referenced by ``CodeLanguage.additionalHighlights`` are bundled. If this fails we fail the test.
    func test_allResourcesAreReferencedInDefinitions() throws {
        for language in CodeLanguage.allLanguages {
            let resourceURL = try XCTUnwrap(
                language.resourceURL?.appendingPathComponent("Resources/tree-sitter-\(language.tsName)")
            )
            let resources = try FileManager.default
                .contentsOfDirectory(
                    atPath: resourceURL.absoluteURL.path(percentEncoded: false)
                )
                .map { String(try XCTUnwrap($0.split(separator: ".").first)) }
                .sorted()

            for bundledResource in resources {
                guard bundledResource != "highlights",
                      !(language.additionalHighlights?.contains(bundledResource) ?? false) else {
                    continue
                }

                print("[warning:] `\(language.id)` is bundling, but not referencing: `\(bundledResource).scm`")
            }

            // If we're referencing any files that don't exist, we need to error out
            let missingFiles = (language.additionalHighlights ?? []).filter({ !Set(resources).contains($0) })
            if !missingFiles.isEmpty {
                XCTFail(
                    "Language `\(language.id)` is referencing files that are not bundled: \(missingFiles)"
                )
            }
        }
    }
}
