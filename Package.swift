// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "RandomAccessCollectionBinarySearch",
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
