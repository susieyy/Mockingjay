// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mockingjay",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Mockingjay",
            targets: ["Mockingjay"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "URITemplate", url: "https://github.com/susieyy/URITemplate.swift.git", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Mockingjay",
            dependencies: [
                .product(name: "URITemplate", package: "URITemplate"),
            ],
            exclude: ["Info.plist"]
        ),
            
        .testTarget(
            name: "MockingjayTests",
            dependencies: [
                "Mockingjay",
                .product(name: "URITemplate", package: "URITemplate"),
            ],
            exclude: ["Info.plist"],
            resources: [.process("TestAudio.m4a")]
        ),
    ]
)
