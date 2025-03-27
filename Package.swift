// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AppIconKit",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "AppIconKit",
            targets: ["AppIconKit"]
        )
    ],
    targets: [
        .target(
            name: "AppIconKit"
        ),
        .testTarget(
            name: "AppIconKitTests",
            dependencies: ["AppIconKit"]
        )
    ]
)
