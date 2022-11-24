//
//  SearchSection.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/24.
//

import Foundation

enum SearchSection: Int, Equatable {
    case recent
    case popular
//    case item

    init(index: Int) {
        switch index {
        case 0: self = .recent
        default: self = .popular
//        default: self = .item
        }
    }

    var headerTitle: String {
        switch self {
        case .recent:
            return "최근검색어"
        case .popular:
            return "인기검색어"
//        case .item:
//            return "최근 본 상품"
        }
    }
}
