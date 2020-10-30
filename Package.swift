// swift-tools-version:5.1
//
//  Package.swift
//  Picker
//
//  Created by Richard Zheng on 6/1/20.
//  Copyright © 2020 Richard Zheng. All rights reserved.
//

// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Picker",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Picker",
            dependencies: ["Kitura"]),
        .testTarget(
            name: "PickerTest",
            dependencies: ["HelloKitura"]),
    ]
)
