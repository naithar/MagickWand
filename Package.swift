import PackageDescription

let package = Package(
    name: "MagickWand",
    dependencies: [
	.Package(url: "https://github.com/naithar/CMagickWand.git", majorVersion: 0)
    ]
)
