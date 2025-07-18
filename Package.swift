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
        .package(url: "https://gitee.com/zhang_chao_fu/CommonKit.git", from: "0.2.26"),
    ],
    targets: [
        .target(
            name: "IMKit",
            dependencies: [
                "CommonKit"
            ],
            resources: [
                
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
