import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

public extension Project {
    static func makeModule(
        name: String,
        product: Product,
        infoPlist: InfoPlist,
        dependencies: [TargetDependency],
        hasTest: Bool = true)
    -> Project {
        let appTarget = Target(
            name: name,
            platform: .iOS,
            product: product,
            bundleId: "com.jee.appstore",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: [.iphone]),
            infoPlist: infoPlist,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: dependencies
        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.jee.appstore",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: name)
            ]
        )
        
        let targets: [Target] = hasTest ? [appTarget, testTarget] : [appTarget]

        return Project(
            name: name,
            organizationName: "jee",
            targets: targets)
    }
    
    /// Helper function to create a framework target and an associated unit test target
    static func makeFrameworkTargets(name: String,
                                     platform: Platform,
                                     iOSTargetVersion: String,
                                     infoPlist: [String: InfoPlist.Value] = [:],
                                     dependencies: [TargetDependency]) -> [Target] {
        let sources = Target(name: name,
                platform: platform,
                product: .framework,
                bundleId: "io.tuist.\(name)",
                infoPlist: .default,
                sources: ["Targets/\(name)/Sources/**"],
                resources: [],
                dependencies: [])
        let tests = Target(name: "\(name)Tests",
                platform: platform,
                product: .unitTests,
                bundleId: "io.tuist.\(name)Tests",
                infoPlist: .default,
                sources: ["Targets/\(name)/Tests/**"],
                resources: [],
                dependencies: [.target(name: name)])
        return [sources, tests]
    }

    /// Helper function to create the application target and the unit test target.
    static func makeAppTargets(name: String,
                               platform: Platform,
                               iOSTargetVersion: String,
                               infoPlist: [String: InfoPlist.Value],
                               dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "io.tuist.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)")
        ])
        return [mainTarget, testTarget]
    }
}
