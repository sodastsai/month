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
  ],
  targets: [
    .target(name: "Month"),
    .testTarget(name: "MonthTests",
                dependencies: [
                  .target(name: "Month"),
                ]),
  ]
)
