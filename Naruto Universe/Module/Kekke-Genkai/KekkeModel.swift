//
//  KekkeModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import Foundation
struct Kekke: Codable {
    var kekkeiGenkai: [KekkeiGenkai]
    let currentPage, pageSize, total: Int

    enum CodingKeys: String, CodingKey {
        case kekkeiGenkai = "kekkei-genkai"
        case currentPage, pageSize, total
    }
}

// MARK: - KekkeiGenkai
struct KekkeiGenkai: Hashable,Codable {
    let id: Int
    let name: String
    let characters: [Int]
}
