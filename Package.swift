// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AntifraudSPM",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AntifraudSPM",
            type: .dynamic,
            targets: ["AntifraudSPM"]),
    ],
    dependencies: [.package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
                  ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AntifraudSPM",
            dependencies: [.target(name: "AntifraudSDK"), .product(name: "CocoaLumberjack", package: "CocoaLumberjack")]
        ),
        .testTarget(
            name: "AntifraudSPMTests",
            dependencies: ["AntifraudSPM"]),
        .binaryTarget(name: "AntifraudSDK",
                      url: "https://github.com/spvagelis/AntifraudSPM/releases/download/1.0.2/AntifraudSDK.xcframework.zip",
                      checksum: "654d2edc4c56f6034babad8df0bf9bd8f935ccdb3ef1e8846b06c79c31f2bbeb")
    ]
)
