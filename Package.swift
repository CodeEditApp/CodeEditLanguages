// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodeEditLanguages",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "CodeEditLanguages",
            targets: ["CodeEditLanguages"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-docc-plugin.git",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/ChimeHQ/SwiftTreeSitter.git",
            exact: "0.7.0"
        ),
    ],
    targets: [
        .target(
            name: "CodeEditLanguages",
            dependencies: ["CodeLanguagesContainer", "SwiftTreeSitter"],
            resources: [
                .copy("Resources")
            ],
            linkerSettings: [.linkedLibrary("c++")]
        ),
        .binaryTarget(
            name: "CodeLanguagesContainer",
            path: "CodeLanguagesContainer.xcframework.zip"
        ),

        .testTarget(
            name: "CodeEditLanguagesTests",
            dependencies: ["CodeEditLanguages"]
        ),
    ]
)
