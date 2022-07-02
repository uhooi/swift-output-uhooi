// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "OutputUhooi",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        .executable(name: "uhooi", targets: ["OutputUhooi"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "OutputUhooi",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "OutputUhooiCore",
            ]),
        .testTarget(
            name: "OutputUhooiTests",
            dependencies: ["OutputUhooi"]),
        .target(
            name: "OutputUhooiCore",
            dependencies: []),
        .testTarget(
            name: "OutputUhooiCoreTests",
            dependencies: ["OutputUhooiCore"]),
    ]
)
