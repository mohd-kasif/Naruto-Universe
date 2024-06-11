//
//  VillageModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import Foundation

struct AllVillages: Codable {
    let villages: [Village]
    let currentPage, pageSize, total: Int
}

// MARK: - Village
struct Village: Hashable,Codable {
    let id: Int
    let name: String
    let characters: [Int]
}
