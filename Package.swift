// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZoraAPI",
    platforms: [
      .macOS(.v12),
      .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ZoraAPI",
            targets: ["ZoraAPI"]),
        .library(name: "ZoraUI", targets: ["ZoraUI"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
      .package(url: "https://github.com/apollographql/apollo-ios", .exact("0.51.2")),
      .package(url: "https://github.com/exyte/SVGView", .exact("1.0.3"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
      .target(name: "ZoraUI", dependencies: ["ZoraAPI", .product(name: "SVGView", package: "SVGView")]),
      .target(
          name: "ZoraAPI",
          dependencies: [.product(name: "Apollo", package: "apollo-ios")]),
      .testTarget(
          name: "ZoraTests",
          dependencies: ["ZoraAPI"]),
    ]
)
