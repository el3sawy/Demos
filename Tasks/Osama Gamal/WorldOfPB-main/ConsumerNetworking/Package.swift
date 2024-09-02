// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConsumerNetworking",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ConsumerNetworking",
            targets: ["ConsumerNetworking"]),
    ],
    dependencies: [
        .package(path: "../WOPDomain")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ConsumerNetworking",
            dependencies: ["WOPDomain"]
        ),
        .testTarget(
            name: "ConsumerNetworkingTests",
            dependencies: ["ConsumerNetworking"]),
    ]
)