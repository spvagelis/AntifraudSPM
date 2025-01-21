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
            targets: ["AntifraudSPM"]),
    ],
    dependencies: [.package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
                  ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AntifraudSPM",
            dependencies: ["AntifraudSDK", .product(name: "CocoaLumberjack", package: "CocoaLumberjack")],
            publicHeadersPath: ""
        ),
        .testTarget(
            name: "AntifraudSPMTests",
            dependencies: ["AntifraudSPM"]),
        .binaryTarget(name: "AntifraudSDK",
                      url: "https://github.com/spvagelis/AntifraudSPM/releases/download/1.0.0/AntifraudSDK.xcframework.zip",
                      checksum: "d481063806de0a4176c64c558bb735e9b74b70f0d4e797df34cc7fe6360dc6a1")
    ]
)
