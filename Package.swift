// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Speakers_modePlugin",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Speakers_modePlugin",
            targets: ["SpeakerPluginPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "SpeakerPluginPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/SpeakerPluginPlugin"),
        .testTarget(
            name: "SpeakerPluginPluginTests",
            dependencies: ["SpeakerPluginPlugin"],
            path: "ios/Tests/SpeakerPluginPluginTests")
    ]
)