//
//  DetailRouter.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/21.
//

import Foundation

import Moya

enum DetailRouter {
    case getDetail
}

extension DetailRouter: TargetType {
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getDetail:
            return URLConstant.searchMain
        }

    }
    
    var method: Moya.Method {
        switch self {
        case .getDetail:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getDetail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getDetail:
            return NetworkConstant.plainHeader
        }
    }
    

    
}
