// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IMKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IMKit",
            targets: ["IMKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/fatbobman/NavigationViewKit", from: "0.0.5"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "7.9.1"),
        .package(url: "https://github.com/moozzyk/SignalR-Client-Swift.git", from: "1.1.0"),
        .package(url: "https://github.com/kakaopensource/KakaJSON", from: "1.1.2"),
        .package(url: "https://github.com/Tencent/wcdb", exact: "2.1.13"),
    ],
    targets: [
        .target(
            name: "IMKit",
            dependencies: [
                "KakaJSON",
                "NavigationViewKit",
                "Kingfisher",
                .product(name: "WCDBSwift", package: "wcdb"),
                .product(name: "SignalRClient", package: "signalr-client-swift"),
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "IMKitTests",
            dependencies: [
                "IMKit"
            ]
        )
    ]
)
