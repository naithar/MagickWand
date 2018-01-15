// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "MagickWand",
    products: [
        .library(name: "MagickWand", targets: ["MagickWand"])
    ],
    targets: [
        .target(name: "CMagickWand", dependencies: []),
        .target(name: "MagickWand", dependencies: ["CMagickWand"]),
        .testTarget(
            name: "MagickWandTests",
            dependencies: ["MagickWand"]
        ),
    ]
)
