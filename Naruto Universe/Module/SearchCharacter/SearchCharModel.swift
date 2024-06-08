//
//  SearchCharModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 07/06/24.
//

import Foundation

// MARK: - Welcome
struct SearchChar: Codable {
    let characters: [SearchableChar]
    let currentPage, pageSize, total: Int
}

// MARK: - Character
struct SearchableChar: Codable,Identifiable {
    let id: Int
    let name: String
    let images: [String]
    let debut: SearchDebut?
    let family: SerachFamily?
    let jutsu, natureType: [String]?
    let personal: PersonalUnion?
    let rank: SearchRank?
    let tools: [String]?
    let voiceActors: SearchVoiceActors?
}

// MARK: - Debut
struct SearchDebut: Codable {
    let manga: String?
    let anime: String?
    let novel, movie, game, ova: String?
    let appearsIn: String?
}

// MARK: - Family
struct SerachFamily: Codable {
    let father, mother, son, daughter: String?
    let wife, adoptiveSon, godfather, grandfather: String?
    let grandmother, uncle, granduncle, adoptiveCousin: String?
    let geneticDonor, chakraDonor, creator, grandson: String?
    let husband, stepfather: String?

    enum CodingKeys: String, CodingKey {
        case father, mother, son, daughter, wife
        case adoptiveSon = "adoptive son"
        case godfather, grandfather, grandmother, uncle, granduncle
        case adoptiveCousin = "adoptive cousin"
        case geneticDonor = "genetic donor"
        case chakraDonor = "chakra donor"
        case creator, grandson, husband, stepfather
    }
}

enum PersonalUnion: Codable {
    case personalClass(PersonalClass)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(PersonalClass.self) {
            self = .personalClass(x)
            return
        }
        throw DecodingError.typeMismatch(PersonalUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PersonalUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .personalClass(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

// MARK: - PersonalClass
struct PersonalClass: Codable {
    let birthdate: String?
    let sex: String?
    let age: SearchAge?
    let kekkeiGenkai: [String]?
    let tailedBeast: String?
    let occupation, affiliation, team, clan: English?
    let titles: [String]?
    let species, status: String?
}

enum English: Codable {
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
        throw DecodingError.typeMismatch(English.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for English"))
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
struct SearchAge: Codable {
    let partI, partII, academyGraduate, blankPeriod: String?
    let chuninPromotion, borutoMovie: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
        case academyGraduate = "Academy Graduate"
        case blankPeriod = "Blank Period"
        case chuninPromotion = "Chunin Promotion"
        case borutoMovie = "Boruto Movie"
    }
}

// MARK: - NinjaRank
struct SearchNinjaRank: Codable {
    let partI, partII, blankPeriod, borutoMovie: String?
    let gaiden, borutoManga: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
        case blankPeriod = "Blank Period"
        case borutoMovie = "Boruto Movie"
        case gaiden = "Gaiden"
        case borutoManga = "Boruto Manga"
    }
}

// MARK: - Rank
struct SearchRank: Codable {
    let ninjaRank: SearchNinjaRank
    let ninjaRegistration: String?
}

// MARK: - VoiceActors
struct SearchVoiceActors: Codable {
    let japanese, english: English?
}

