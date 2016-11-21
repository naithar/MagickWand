import PackageDescription

let package = Package(
    name: "MagickWand",
    targets: [
        Target(name: "MagickWand", dependencies: ["CMagickWand"]),
        Target(name: "CMagickWand", dependencies: [])
    ], dependencies: [
    ]
)
