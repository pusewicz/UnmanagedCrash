// swift-tools-version: 6.1

import PackageDescription

let package = Package(
  name: "UnmanagedCrash",
  targets: [
    .executableTarget(
      name: "UnmanagedCrash",
      dependencies: [
        "CPicoECS"
      ],
      path: "Sources",
    ),
    .target(
      name: "CPicoECS",
      path: "ThirdParty",
      sources: ["pico_ecs.c"],
      publicHeadersPath: "include"
    ),
  ]
)
