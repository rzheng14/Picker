// swift-tools-version:5.1
//
//  Package.swift
//  Picker
//
//  Created by Richard Zheng on 6/1/20.
//  Copyright © 2020 Richard Zheng. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "Picker",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "MyLibrary", targets: ["MyLibrary"]),
    ],
    dependencies: [
        .package(url: "https://url/of/another/package/named/Utility", from: "1.0.0"),
    ],
    targets: [
        .target(name: "MyLibrary", dependencies: ["Utility"]),
        .testTarget(name: "MyLibraryTests", dependencies: ["MyLibrary"]),
    ]
)
