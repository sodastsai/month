// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "Month",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(name: "Month", targets: ["Month"]),
    .library(name: "MonthArgumentParser", targets: ["MonthArgumentParser"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
  ],
  targets: [
    .target(name: "Month"),
    .target(
      name: "MonthArgumentParser",
      dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")]
    ),
    .testTarget(name: "MonthTests",
                dependencies: [
                  .target(name: "Month"),
                ]),
    .testTarget(name: "MonthArgumentParserTests",
                dependencies: [
                  .target(name: "Month"),
                  .target(name: "MonthArgumentParser"),
                ]),
  ]
)
