// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "BrandButton",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "BrandButton",
            targets: ["BrandButton"]
        ),
    ],
    targets: [
        .target(
            name: "BrandButton",
            dependencies: [],
            path: "Sources",
            resources: [.process("Resources")]
        ),
    ]
)
