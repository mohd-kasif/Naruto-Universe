//
//  CharacterModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 21/04/24.
//

import Foundation

// MARK: - Welcome
struct CharcterInfo: Codable {
    let characters: [Character]?
    let currentPage, pageSize, total: Int?
}

// MARK: - Character
struct Character: Codable {
    let id: Int
    let name: String?
    let images: [String]?
    let debut: Debut?
    let family: Family?
    let jutsu, natureType: [String]?
    let personal: Personal?
    let rank: Rank?
    let tools: [String]?
//    let voiceActors: VoiceActors?
}

// MARK: - Debut
struct Debut: Codable {
    let manga, anime, novel, movie: String?
    let game, ova, appearsIn: String?
}

// MARK: - Family
struct Family: Codable {
    let father, mother, brother, niece: String?
}

// MARK: - Personal
struct Personal: Codable {
    let birthdate, sex: String?
    let age: Age?
    let status: String?
    let height, weight: Eight?
    let bloodType: String?
    let kekkeiGenkai: [String]?
    let classification: Classification?
//    let classification: [String]?
    let occupation: Occupation?
//    let affiliation: [String]?
    let affiliation: Affiliation?
    let partner: [String]?
    let team:Team?
    let clan: String?
    let titles: [String]?
    let species: String?
}
//struct Affiliation:Codable{
//    
//}
enum Affiliation: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Affiliation.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Affiliation"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}
enum Team: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Team.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Team"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Age
struct Age: Codable {
    let partI, partII, academyGraduate, chuninPromotion: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
        case academyGraduate = "Academy Graduate"
        case chuninPromotion = "Chunin Promotion"
    }
}
enum Occupation:Codable{
    case string(String)
    case stringArray([String])
    
    init(from decoder:Decoder) throws{
        let container=try decoder.singleValueContainer()
        if let x = try? container.decode([String].self){
            self = .stringArray(x)
            return
        }
        if let x=try? container.decode(String.self){
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Classification.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription:   "Wrong type for Occupation"))
    }
    func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}
enum Classification: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Classification.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Classification"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Eight
struct Eight: Codable {
    let partI, partII: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
    }
}

// MARK: - Rank
struct Rank: Codable {
    let ninjaRank: NinjaRank?
    let ninjaRegistration: String?
}

// MARK: - NinjaRank
struct NinjaRank: Codable {
    let partI: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
    }
}

// MARK: - VoiceActors
struct VoiceActors: Codable {
    let japanese, english: [String]?
}

