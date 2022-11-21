//
//  GeneralResponse.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/21.
//

import Foundation

struct GeneralResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool?
    var message: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case message
        case success
        case data
        case status
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        success = (try? values.decode(Bool.self, forKey: .success)) ?? nil
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
        status = (try? values.decode(Int.self, forKey: .status)) ?? 0
    }
}

struct VoidType: Codable {}

