//
//  GenerateMoules.swift
//  ProjectDescriptionHelpers
//
//  Created by Jihee hwang on 2023/06/18.
//

import Foundation

enum Modules {
    case feature
    case presentaion // View, ViewModel, UI
    case domain // UseCase, Entity
    case core // Service, Repository, Extension
    case shared // Logger
    
    public var name: String {
        switch self {
        case .feature:
            return "Feature"
        case .presentaion:
            return "Presentation"
        case .domain:
            return "Domain"
        case .core:
            return "Core"
        case .shared:
            return "Shared"
        }
    }
    
    public var path: String {
        switch self {
        case .feature, .presentaion, .domain, .core, .shared:
            return "Projects/\(name)"
        }
    }
}
