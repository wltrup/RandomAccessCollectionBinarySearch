// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "RandomAccessCollectionBinarySearch",
    platforms: [
        .iOS(.v10),
        .watchOS(.v4),
        .tvOS(.v10),
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "RandomAccessCollectionBinarySearch",
            targets: ["RandomAccessCollectionBinarySearch"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RandomAccessCollectionBinarySearch",
            dependencies: []
        ),
        .testTarget(
            name: "RandomAccessCollectionBinarySearchTests",
            dependencies: ["RandomAccessCollectionBinarySearch"]
        ),
    ]
)
