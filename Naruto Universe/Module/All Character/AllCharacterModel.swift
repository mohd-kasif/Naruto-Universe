//
//  AllCharacterModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 24/04/24.
//

import Foundation

struct AllCharacter: Codable {
    var characters: [Characters]
    let currentPage, pageSize, total: Int
}

// MARK: - Character
struct Characters: Hashable,Codable{
    let id: Int
    let name: String
    let images: [String]
    let debut: CharDebut?
    let family: CharFamily?
    let jutsu: [String]
    let natureType: [String]?
    let personal: CharPersonalInfo
//    let rank: CharRank?
    let tools: [String]?
    let voiceActors: CharVoiceActors?
    let uniqueTraits: [String]?
    
}

// MARK: - Debut
struct CharDebut: Hashable,Codable {
    let manga, anime: String?
    let novel, movie: String?
    let game: String?
    let ova: String?
    let appearsIn: String?
}

enum AppearsIn: String, Codable {
    case animeMangaGame = "Anime, Manga, Game"
    case animeMangaGameMovie = "Anime, Manga, Game, Movie"
    case animeMangaNovelGameMovie = "Anime, Manga, Novel, Game, Movie"
}

// MARK: - Family
struct CharFamily: Hashable,Codable {
    var father, mother, son, daughter: String?
    var wife, adoptiveSon, godfather, brother: String?
    var cloneSon, familyGrandmother, sister, nephew: String?
    var uncle, adoptiveMother, adoptiveSons, adoptiveBrother: String?
    var clone, godson, greatGrandfather, grandfather: String?
    var grandmother, cousin, geneticTemplateParent, cloneBrother: String?
    var pet, grandson, granddaughter, granduncle: String?
    var aunt, firstCousinOnceRemoved, host, niece: String?
    var lover, creator, geneticTemplate: String?

    enum CodingKeys: String, CodingKey {
        case father, mother, son, daughter, wife
        case adoptiveSon = "adoptive son"
        case godfather, brother
        case cloneSon = "clone/son"
        case familyGrandmother = "grandmother "
        case sister, nephew, uncle
        case adoptiveMother = "adoptive mother"
        case adoptiveSons = "adoptive sons"
        case adoptiveBrother = "adoptive brother"
        case clone, godson
        case greatGrandfather = "great-grandfather"
        case grandfather, grandmother, cousin
        case geneticTemplateParent = "genetic template/parent"
        case cloneBrother = "clone/brother"
        case pet = "pet "
        case grandson, granddaughter, granduncle, aunt
        case firstCousinOnceRemoved = "first cousin once removed"
        case host, niece, lover, creator
        case geneticTemplate = "genetic template"
    }
    
    func filteValues()->CharFamily{
        var filteredFamily=self
        let mirror=Mirror(reflecting: self)
        for child in mirror.children{
            if let propertyName=child.label, let propertyValue=child.value as? String{
                if propertyValue.isEmpty{
                    switch propertyName{
                    case "father": filteredFamily.father = nil
                    case "mother": filteredFamily.mother = nil
                    case "son": filteredFamily.son = nil
                    case "daughter": filteredFamily.daughter = nil
                    case "wife": filteredFamily.wife = nil
                    case "adoptiveSon": filteredFamily.adoptiveSon = nil
                    case "godfather": filteredFamily.godfather = nil
                    case "brother": filteredFamily.brother = nil
                    case "cloneSon": filteredFamily.cloneSon = nil
                    case "familyGrandmother": filteredFamily.familyGrandmother = nil
                    case "sister": filteredFamily.sister = nil
                    case "nephew": filteredFamily.nephew = nil
                    case "uncle": filteredFamily.uncle = nil
                    case "adoptiveMother": filteredFamily.adoptiveMother = nil
                    case "adoptiveSons": filteredFamily.adoptiveSons = nil
                    case "adoptiveBrother": filteredFamily.adoptiveBrother = nil
                    case "clone": filteredFamily.clone = nil
                    case "godson": filteredFamily.godson = nil
                    case "greatGrandfather": filteredFamily.greatGrandfather = nil
                    case "grandfather": filteredFamily.grandfather = nil
                    case "grandmother": filteredFamily.grandmother = nil
                    case "cousin": filteredFamily.cousin = nil
                    case "geneticTemplateParent": filteredFamily.geneticTemplateParent = nil
                    case "cloneBrother": filteredFamily.cloneBrother = nil
                    case "pet": filteredFamily.pet = nil
                    case "grandson": filteredFamily.grandson = nil
                    case "granddaughter": filteredFamily.granddaughter = nil
                    case "granduncle": filteredFamily.granduncle = nil
                    case "aunt": filteredFamily.aunt = nil
                    case "firstCousinOnceRemoved": filteredFamily.firstCousinOnceRemoved = nil
                    case "host": filteredFamily.host = nil
                    case "niece": filteredFamily.niece = nil
                    case "lover": filteredFamily.lover = nil
                    case "creator": filteredFamily.creator = nil
                    case "geneticTemplate": filteredFamily.geneticTemplate = nil
                    default: break
                    }
                }
            }
        }
        return filteredFamily
    }
}

// MARK: - Personal
struct CharPersonalInfo: Hashable,Codable {
    let birthdate: String?
    let sex: String?
    let age: CharAge?
    let height: Height?
    let weight: Weight?
    let bloodType: BloodType?
    let kekkeiGenkai, classification: Clan?
    let tailedBeast: String?
    let occupation: Clan?
    let affiliation: CharAffiliation?
    let team, clan: Clan?
    let titles: [String]?
    let status: String?
    let kekkeiMōra:KekkeiMora?
    let partner: Clan?
    let species: String?
}


enum CharAffiliation: Hashable,Codable {
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
        throw DecodingError.typeMismatch(Clan.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Clan"))
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
struct CharAge: Hashable,Codable {
    let partI, partII, academyGraduate, chuninPromotion: String?
    let blankPeriod, borutoMovie, borutoManga: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
        case academyGraduate = "Academy Graduate"
        case chuninPromotion = "Chunin Promotion"
        case blankPeriod = "Blank Period"
        case borutoMovie = "Boruto Movie"
        case borutoManga = "Boruto Manga"
    }
}

enum BloodType: String, Hashable, Codable {
    case a = "A"
    case ab = "AB"
    case b = "B"
    case o = "O"
}

enum Clan: Hashable,Codable {
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
        throw DecodingError.typeMismatch(Clan.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Clan"))
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

// MARK:- KekkeiMora
enum KekkeiMora:Hashable,Codable{
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
        throw DecodingError.typeMismatch(Clan.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for KekkeiMora"))
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

// MARK: - Height
struct Height: Hashable,Codable {
    let partI, partII, blankPeriod, gaiden: String?
    let borutoMovie, borutoManga: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
        case blankPeriod = "Blank Period"
        case gaiden = "Gaiden"
        case borutoMovie = "Boruto Movie"
        case borutoManga = "Boruto Manga"
    }
}

enum Sex: String, Codable {
    case female = "Female"
//    case fileGenderVariousSVGVarious = "File:Gender Various.svg Various"
    case male = "Male"
}

// MARK: - Weight
struct Weight: Hashable,Codable {
    let partI, partII: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
    }
}

// MARK: - Rank
struct CharRank: Codable {
    let ninjaRank: CharNinjaRank
    let ninjaRegistration: String?
}

// MARK: - NinjaRank
struct CharNinjaRank: Codable {
    let partI, gaiden, blankPeriod, partII, borutoMovie: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case gaiden = "Gaiden"
        case blankPeriod = "Blank Period"
        case partII = "Part II"
        case borutoMovie = "Boruto Movie"
    }
}

// MARK: - VoiceActors
struct CharVoiceActors: Hashable,Codable {
    let japanese, english: Clan?
}
