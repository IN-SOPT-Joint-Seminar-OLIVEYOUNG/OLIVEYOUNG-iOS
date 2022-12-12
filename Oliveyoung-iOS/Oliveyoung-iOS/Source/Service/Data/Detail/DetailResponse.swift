//
//  DetailResponse.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/21.
//

import Foundation

// MARK: - DetailMain
struct DetailMainResponse: Codable {
    let products1: [Product1]
    let recommend: [Recommend]
}

// MARK: - DataClass
struct DataClass: Codable {
    let product: Product
    let recommends, similars: [ResultRecommend]
}

// MARK: - Product
struct Product1: Codable {
    let brandName, name, saledPrice, originalPrice: String
    let salePercent: String
    let mainImg, detailImg: String
    let detailImgHeight, detailImgWidth: Int
    let isLiked: Bool
    let rate: Double
    let reviewCount: String
}

// MARK: - Recommend
struct ResultRecommend: Codable {
    let brandName: String
    let mainImg: String
    let name, saledPrice: String
    let salePercent: String?
}

//// MARK: - Relate
//struct Relate: Codable {
//    let brandName: String
//    let mainImg: String
//    let name, saledPrice: String
//    let salePercent: String?
//}
