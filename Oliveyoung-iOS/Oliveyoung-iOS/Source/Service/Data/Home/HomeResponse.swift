//
//  HomeResponse.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/21.
//

import Foundation

// MARK: - PickedProductList
struct PickedProductList: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [Recommend]
}

// MARK: - Recommend
struct Recommend: Codable {
    let brandName: String
    let mainImg: String
    let name, saledPrice, salePercent: String
    
    func convertToRecommend() -> Recommend {
        return Recommend(brandName: self.brandName, mainImg: self.mainImg, name: self.name, saledPrice: self.saledPrice, salePercent: self.salePercent)
    }
}




