// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "OutputUhooi",
    platforms: [
        .macOS(.v10_10),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "OutputUhooi",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .testTarget(
            name: "OutputUhooiTests",
            dependencies: ["OutputUhooi"]),
    ]
)
