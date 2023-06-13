//
//  Dependencies.swift
//  Config
//
//  Created by Jihee hwang on 2023/06/13.
//

import ProjectDescription

let dependencies: Dependencies = .init(
    carthage: [],
    swiftPackageManager: [
        .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMajor(from: "6.6.0")),
        .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.6.4")),
        .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.0.1"))
    ],
    platforms: [.iOS]
)
