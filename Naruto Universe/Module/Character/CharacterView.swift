//
//  CharacterView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 21/04/24.
//

import SwiftUI

struct CharacterView: View {
    var charInfo:Characters
    var nonNilFAmily:CharFamily{
        return (charInfo.family?.filteValues()) ?? CharFamily()
    }
    init(charInfo: Characters) {
        self.charInfo = charInfo
        print(self.charInfo,"char info")
    }
    var body: some View {
        ZStack{
            Color.color("#8a1e22")
                .ignoresSafeArea()
        VStack{
            CacheImage(url: URL(string: charInfo.images[0])!){phase in
                switch phase{
                case .empty:
                    ProgressView()
                        .frame(width: 160,height: 200)
                case .success(let image):
                    image.resizable()
                        .frame(width: 250,height: 300)
                        .cornerRadius(6)
                        .shadow(radius: 6)
                        .zIndex(1)
                default:
                    //                    let _ = Logger.info(description: "erorr during caching")
                    let _ = print("error during caching")
                    Color.clear
                        .frame(maxWidth: 40, maxHeight: 40)
                }
            
        }
            VStack(alignment:.leading){
                ScrollView{
                    SingleStack(charKey: "Name", charVaue: charInfo.name)
                        .padding(.top,40)
               
                HStack{
                    NjNarutoText.shared.getHeadlineText(inputString: "Clan: ", withSize: 16)
                    if let clan=charInfo.personal.clan{
                        if case .string(let string) = clan {
                            NjNarutoText.shared.getH3Text(inputString: "\(string) Clan", withSize: 14)
                        } else if case .stringArray(let array) = clan {
                            NjNarutoText.shared.getH3Text(inputString: "\(array[0]) Clan", withSize: 14)
                        }
                    }
                    Spacer()
                }
                .padding(.leading,5)
                    SingleStack(charKey: "Dob", charVaue: charInfo.personal.birthdate ?? "")
                    NjNarutoText.shared.getHeadlineText(inputString: "Nature Type", withSize: 18)
                        .frame(alignment: .center)
                    NjNarutoText.shared.getH3Text(inputString: charInfo.natureType?.joined(separator: ",") ?? "", withSize: 14)
                        .padding([.leading],10)
                HStack{
                    NjNarutoText.shared.getHeadlineText(inputString: "Occupation: ", withSize: 16)
                    if let occupation=charInfo.personal.occupation{
                        if case .string(let string) = occupation {
                            NjNarutoText.shared.getH3Text(inputString: string, withSize: 14)
                        } else if case .stringArray(let array) = occupation {
                            NjNarutoText.shared.getH3Text(inputString: array.joined(separator: ","), withSize: 14)
                        }
                    }
                    Spacer()
                }
                .padding(.leading,5)
                    NjNarutoText.shared.getHeadlineText(inputString: "Family", withSize: 18)
                        .frame(alignment: .center)
                    if let father = nonNilFAmily.father{
                        SingleStack(charKey: "Father", charVaue: father)
                    }
                    if let mother = nonNilFAmily.mother{
                        SingleStack(charKey: "Mother", charVaue: mother)
                    }
                    if let wife = nonNilFAmily.wife{
                        SingleStack(charKey: "Wife", charVaue: wife)
                    }
                    if let godFather = nonNilFAmily.godfather{
                        SingleStack(charKey: "God Father", charVaue: godFather)
                    }
                    if let son = nonNilFAmily.son{
                        SingleStack(charKey: "Son", charVaue: son)
                    }
                    if let daugher = nonNilFAmily.daughter{
                        SingleStack(charKey: "Daughter", charVaue: daugher)
                    }
                    if let brother = nonNilFAmily.brother{
                        SingleStack(charKey: "Brother", charVaue: brother)
                    }
                    if let lover = nonNilFAmily.lover{
                        SingleStack(charKey: "Lover", charVaue: lover)
                    }
                    NjNarutoText.shared.getHeadlineText(inputString: "Character Debut", withSize: 18)
                        .frame(alignment: .center)
                    SingleStack(charKey: "Manga", charVaue: charInfo.debut?.manga ?? "")
                    SingleStack(charKey: "Anime", charVaue: charInfo.debut?.anime ?? "")
                    SingleStack(charKey: "Novel", charVaue: charInfo.debut?.novel ?? "")
                    SingleStack(charKey: "Movie", charVaue: charInfo.debut?.movie ?? "")
                    SingleStack(charKey: "Game", charVaue: charInfo.debut?.game ?? "")
                    SingleStack(charKey: "OVA", charVaue: charInfo.debut?.ova ?? "")
                    NjNarutoText.shared.getHeadlineText(inputString: "Jutsu", withSize: 18)
                        .frame(alignment: .center)
                    NjNarutoText.shared.getH3Text(inputString: charInfo.jutsu.joined(separator: ", "), withSize: 14)
                        .padding([.leading],10)
                    NjNarutoText.shared.getHeadlineText(inputString: "Kekkei-Genkai", withSize: 18)
                        .frame(alignment: .center)
                    if let kekkei=charInfo.personal.kekkeiGenkai{
                        if case .string(let string) = kekkei {
                            NjNarutoText.shared.getH3Text(inputString: string, withSize: 14)
                                .padding([.leading],10)
                        } else if case .stringArray(let array) = kekkei {
                            NjNarutoText.shared.getH3Text(inputString: array.joined(separator: ", "), withSize: 14)
                                .padding([.leading],10)
                        }
                    }
                    if let kekkeiMora=charInfo.personal.kekkeiMōra{
                        NjNarutoText.shared.getHeadlineText(inputString: "Kekkei-Mōra", withSize: 18)
                            .frame(alignment: .center)
                        if case .string(let string) = kekkeiMora {
                            NjNarutoText.shared.getH3Text(inputString: string, withSize: 14)
                                .padding([.leading],5)
                        } else if case .stringArray(let array) = kekkeiMora {
                            NjNarutoText.shared.getH3Text(inputString: array.joined(separator: ", "), withSize: 14)
                                .padding([.leading],5)
                        }
                    }
                    NjNarutoText.shared.getHeadlineText(inputString: "Affiliation", withSize: 18)
                        .frame(alignment: .center)
                    if let affiliation=charInfo.personal.affiliation{
                        if case .string(let string) = affiliation {
                            NjNarutoText.shared.getH3Text(inputString: string, withSize: 14)
                                .padding([.leading],10)
                        } else if case .stringArray(let array) = affiliation {
                            NjNarutoText.shared.getH3Text(inputString: array.joined(separator: ", "), withSize: 14)
                                .padding([.leading],10)
                        }
                    }
                    NjNarutoText.shared.getHeadlineText(inputString: "Team", withSize: 18)
                        .frame(alignment: .center)
                    if let team=charInfo.personal.team{
                        if case .string(let string) = team {
                            NjNarutoText.shared.getH3Text(inputString: string, withSize: 14)
                                .padding([.leading],5)
                        } else if case .stringArray(let array) = team {
                            NjNarutoText.shared.getH3Text(inputString: array.joined(separator: ", "), withSize: 14)
                                .padding([.leading],10)
                        }
                    }
                    if let titles=charInfo.personal.titles{
                        NjNarutoText.shared.getHeadlineText(inputString: "Titles", withSize: 18)
                            .frame(alignment: .center)
                        NjNarutoText.shared.getH3Text(inputString: titles.joined(separator: ", "), withSize: 14)
                            .padding([.leading],5)
                    }
                    if let partner=charInfo.personal.partner{
                        NjNarutoText.shared.getHeadlineText(inputString: "Partner", withSize: 18)
                            .frame(alignment: .center)
                        if case .string(let string) = partner {
                            NjNarutoText.shared.getH3Text(inputString: string, withSize: 14)
                                .padding([.leading],5)
                        } else if case .stringArray(let array) = partner {
                            NjNarutoText.shared.getH3Text(inputString: array.joined(separator: ", "), withSize: 14)
                                .padding([.leading],5)
                        }
                    }
                    if let species=charInfo.personal.species{
                        SingleStack(charKey: "Species", charVaue: species)
                    }
                       
//                    SingleStack(charKey: "Kekkei-Genkai", charVaue: charInfo.personal.kekkeiGenkai)
                    
                Spacer()
            }
                    
                }
                .frame(width:350)
                .background(Color.color("#e5dce6"))
                .cornerRadius(8)
                .shadow(radius: 8)
                .offset(y:-45)
            }
            
        }
        .navBar(title: "Info", backBtnAllow: true, backButton: {
            Router.shared.goBack()
        })
        
    }
}
//#Preview {
//    CharacterView()
//}


struct SingleStack:View {
    var charKey:String
    var charVaue:String
    init(charKey: String, charVaue: String) {
        self.charKey = charKey
        self.charVaue = charVaue
    }
    var body: some View {
        HStack{
            NjNarutoText.shared.getHeadlineText(inputString: "\(charKey+": ")", withSize: 16)
            NjNarutoText.shared.getH3Text(inputString: charVaue, withSize: 14)
            Spacer()
        }
        .padding(.leading,5)
    }
}
