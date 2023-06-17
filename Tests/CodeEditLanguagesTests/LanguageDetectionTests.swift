//
//  LanguageDetectionTests.swift
//  CodeEditLanguages
//
//  Created by Khan Winter on 6/17/23.
//

import XCTest
@testable import CodeEditLanguages
import RegexBuilder

// swiftlint:disable all
final class LanguageDetectionTests: XCTestCase {
    func test_shebang() {
        let validCases = [
            "#! /usr/bin/env swift",
            "#! /usr/bin/env -S swift",
            "#!/usr/bin/env swift",
            "#!     /usr/bin/env         swift",
            "#! swift",
            "#!swift"
        ]

        let invalidCases = [
            "1234",
            "import CodeEditLanguages",
            "",
            "\n",
            "# This is a regular comment",
            "#!",
            "#",
            "!"
        ]

        for validCase in validCases {
            let detectedLanguage = CodeLanguage.detectLanguageFrom(url: URL(filePath: ""), prefixBuffer: validCase)
            XCTAssert(
                detectedLanguage == .swift,
                "Parser failed to find valid shebang language. Given \"\(validCase)\", found \(detectedLanguage), expected swift."
            )
        }

        for invalidCase in invalidCases {
            let detectedLanguage = CodeLanguage.detectLanguageFrom(url: URL(filePath: ""), prefixBuffer: invalidCase)
            XCTAssert(
                detectedLanguage == .default,
                "Parser unexpectedly found valid shebang language. Given \"\(invalidCase)\", found \(detectedLanguage), expected default."
            )
        }
    }

    func test_vimModeline() {
        let validCases = [
            "// vim: ft=swift",
            "/* vim: ft=swift */",
            "/* vim: other=param a=b ft=swift b=d\n*/",
            "// vim: other=param a=b ft=swift b=d",
        ]

        let invalidCases = [
            "//vim:",
            "//vim",
            "// This is a normal comment",
            "/*vim",
            "/* vim",
            "/* this is also a normal comment */",
            "1234",
            "import CodeEditLanguages",
            "",
            "\n"
        ]

        for validCase in validCases {
            let detectedLanguage = CodeLanguage.detectLanguageFrom(url: URL(filePath: ""), prefixBuffer: validCase)
            XCTAssert(
                detectedLanguage == .swift,
                "Parser failed to find valid shebang language. Given \"\(validCase)\", found \(detectedLanguage), expected swift."
            )
        }

        for invalidCase in invalidCases {
            let detectedLanguage = CodeLanguage.detectLanguageFrom(url: URL(filePath: ""), prefixBuffer: invalidCase)
            XCTAssert(
                detectedLanguage == .default,
                "Parser unexpectedly found valid shebang language. Given \"\(invalidCase)\", found \(detectedLanguage), expected default."
            )
        }
    }

    func test_emacsModeline() {
        let validCases = [
            "-*- mode:swift -*-",
            "-*- indent-style: tabs mode: swift -*-",
            "-*-mode: swift-*-"
        ]

        let invalidCases = [
            "1234",
            "import CodeEditLanguages",
            "",
            "\n",
            "-*-",
            "-*- -*-",
            "-- -*-",
            "mode:swift"
        ]

        for validCase in validCases {
            let detectedLanguage = CodeLanguage.detectLanguageFrom(url: URL(filePath: ""), prefixBuffer: validCase)
            XCTAssert(
                detectedLanguage == .swift,
                "Parser failed to find valid shebang language. Given \"\(validCase)\", found \(detectedLanguage), expected swift."
            )
        }

        for invalidCase in invalidCases {
            let detectedLanguage = CodeLanguage.detectLanguageFrom(url: URL(filePath: ""), prefixBuffer: invalidCase)
            XCTAssert(
                detectedLanguage == .default,
                "Parser unexpectedly found valid shebang language. Given \"\(invalidCase)\", found \(detectedLanguage), expected default."
            )
        }
    }
}
// swiftlint:enable all
