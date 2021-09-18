// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "OutputUhooi",
    platforms: [
        .macOS(.v10_10),
    ],
    dependencies: [
    ],
    targets: [
        .executableTarget(
            name: "OutputUhooi",
            dependencies: [
            ]),
        .testTarget(
            name: "OutputUhooiTests",
            dependencies: ["OutputUhooi"]),
    ]
)
