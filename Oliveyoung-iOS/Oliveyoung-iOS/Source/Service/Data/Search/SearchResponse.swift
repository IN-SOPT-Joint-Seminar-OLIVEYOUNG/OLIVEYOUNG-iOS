//
//  SearchResponse.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/21.
//

import Foundation

//struct ResentWords: Codable {
//    let recentWords: [Word]
//}

struct Word {
    let word: String
}

extension Word {
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
