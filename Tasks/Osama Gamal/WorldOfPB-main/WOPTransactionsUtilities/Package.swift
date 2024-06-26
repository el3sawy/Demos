// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WOPTransactionsUtilities",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "WOPTransactionsUtilities",
            targets: ["WOPTransactionsUtilities"]),
    ],
    dependencies: [
        .package(path: "../WOPDomain")
    ],
    targets: [
        .target(
            name: "WOPTransactionsUtilities",
            dependencies: ["WOPDomain"]
        ),
        .testTarget(
            name: "WOPTransactionsUtilitiesTests",
            dependencies: ["WOPTransactionsUtilities"]
        )
    ]
)
