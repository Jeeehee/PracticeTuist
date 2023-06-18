//
//  Project.swift
//  Config
//
//  Created by Jihee hwang on 2023/06/13.
//

import ProjectDescription
import ProjectDescriptionHelpers

let appName = "AppStore"
let project = Project.makeModule(name: appName,
                                  product: .app,
                                  infoPlist: .file(path: "Support/Info.plist"),
                                  dependencies: [.SPM.RxSwift.dependency,
                                                 .SPM.Alamofire.dependency,
                                                 .SPM.SnapKit.dependency
                                  ])
