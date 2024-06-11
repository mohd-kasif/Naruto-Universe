//
//  TeamsModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import Foundation

// MARK: - AllTeams
struct AllTeams: Codable {
    var teams: [Teams]
    let currentPage, pageSize, total: Int
}

// MARK: - Teams
struct Teams: Hashable,Codable {
    let id: Int
    let name: String
    let characters: [Int]
}
