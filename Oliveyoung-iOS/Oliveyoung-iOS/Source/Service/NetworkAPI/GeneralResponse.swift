//
//  GeneralResponse.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/21.
//

import Foundation

struct GeneralResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: T?
}
