//
//  SearchRouter.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/21.
//

import Foundation

import Moya

enum SearchRouter {
    case getSearch
}

extension SearchRouter: TargetType {
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getSearch:
            return URLConstant.searchMain
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSearch:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getSearch:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getSearch:
            return NetworkConstant.plainHeader
        }
    }
    
    
}
