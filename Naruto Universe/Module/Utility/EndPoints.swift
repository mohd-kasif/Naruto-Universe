//
//  EndPoints.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 21/04/24.
//

import Foundation

enum AllUrl{
    static let baseUrl="https://dattebayo-api.onrender.com"
    static let allCharacter="https://dattebayo-api.onrender.com/characters"
    static let page="https://dattebayo-api.onrender.com/characters?page="
    static let serachChar="https://dattebayo-api.onrender.com/characters/?name="
    static let allClan="https://dattebayo-api.onrender.com/clans?page="
    static let itachi="https://dattebayo-api.onrender.com/characters/?name=itachi"
    static let allVillage="https://dattebayo-api.onrender.com/villages/?limit=40"
    static let kekkeGenkai="https://dattebayo-api.onrender.com/kekkei-genkai/?page="
    static let teams="https://dattebayo-api.onrender.com/teams/?page="
}
enum Api{
    static let characterName="/characters?name="
}
enum SubUrl{
    static let allCharacter="/characters"
}

//https://dattebayo-api.onrender.com/characters/?name=itachi


enum HttpMethod:String{
    case Post="POST"
    case Get="GET"
}
