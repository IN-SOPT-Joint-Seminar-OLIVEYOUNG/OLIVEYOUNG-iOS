//
//  SearchResponse.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/21.
//

import Foundation

// MARK: - SearchMain
struct SearchMainResponse: Codable {
    let recentWords: [String]
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let brandName: String
    let mainImg: String
    let name, saledPrice, salePercent: String
}

struct Word {
    let word: String
}

extension Word {
    static func setRecentWordDummy() -> [String] {
        return ["립밤", "핸드크림", "썬쿠션", "틴트"]
    }
    static func recentWordDummy() -> [Word] {
        return [
            Word(word: "립밤"),
            Word(word: "핸드크림"),
            Word(word: "썬쿠션"),
            Word(word: "틴트")
        ]
    }
    static func popularWordDummy() -> [Word] {
        return [
            Word(word: "립밤"),
            Word(word: "핸드크림"),
            Word(word: "썬쿠션"),
            Word(word: "틴트"),
            Word(word: "마스크팩"),
            Word(word: "핸드크림"),
            Word(word: "여드름패치"),
            Word(word: "립밤"),
            Word(word: "핸드크림"),
            Word(word: "썬쿠션"),
            Word(word: "틴트"),
            Word(word: "마스크팩"),
            Word(word: "핸드크림"),
            Word(word: "여드름패치")
        ]
    }
}
