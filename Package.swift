// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Stats",
    products: [
        .library(name: "ncurses", targets: ["ncurses"]),
        .executable(name: "CursesTest", targets: ["CursesTest"])
    ],
    dependencies: [
    ],
    targets: [
        .systemLibrary(name: "ncurses"),
        .target(name: "CursesTest", dependencies: ["ncurses"]),
    ]
)
