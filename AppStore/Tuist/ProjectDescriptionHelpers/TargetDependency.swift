//
//  TargetDependency.swift
//  ProjectDescriptionHelpers
//
//  Created by Jihee hwang on 2023/06/13.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {
        case RxSwift
        case Alamofire
        case SnapKit
        
        public var dependency: TargetDependency {
            switch self {
            case .RxSwift:
                return .external(name: "RxSwift")
                
            case .Alamofire:
                return .external(name: "Alamofire")
                
            case .SnapKit:
                return .external(name: "SnapKit")
            }
        }
    }
    
}
