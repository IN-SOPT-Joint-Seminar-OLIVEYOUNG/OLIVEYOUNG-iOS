//
//  HomeRouter.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/21.
//

import Foundation

import Moya

enum HomeRouter {
    case getRecommemd
}

extension HomeRouter: TargetType {
    var path: String {
        switch self{
        case .getRecommemd:
            return URLConstant.mainPick
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getRecommemd:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getRecommemd:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getRecommemd:
            return NetworkConstant.plainHeader
        }
    }
    
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
}
