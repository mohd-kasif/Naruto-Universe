//
//  ClanModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import Foundation

// MARK: - AllClan
struct AllClan: Codable {
    var clans: [ClanModel]
    let currentPage, pageSize, total: Int
}

// MARK: - ClanModel
struct ClanModel: Codable,Hashable {
    let id: Int
    let name: String
    let characters: [Int]
}
