// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WOPTransactionsListFeature",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "WOPTransactionsListFeature",
            targets: ["WOPTransactionsListFeature"]),
    ],
    dependencies: [
        .package(path: "../WOPDomain"),
        .package(path: "../WOPDesignSystem"),
        .package(path: "../WOPTransactionsUtilities"),
    ],
    targets: [
        .target(
            name: "WOPTransactionsListFeature",
            dependencies: [
                "WOPDomain",
                "WOPDesignSystem",
                "WOPTransactionsUtilities"
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "WOPTransactionsListFeatureTests",
            dependencies: ["WOPTransactionsListFeature"]
        )
    ]
)
