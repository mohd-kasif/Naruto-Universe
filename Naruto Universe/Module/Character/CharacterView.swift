//
//  CharacterView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 21/04/24.
//

import SwiftUI

struct CharacterView: View {
    var charInfo:Characters
    init(charInfo: Characters) {
        self.charInfo = charInfo
        print(self.charInfo,"char info")
    }
    var body: some View {
        ZStack{
            Color.color("#8a1e22")
                .ignoresSafeArea()
            ScrollView{
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
                            //                        .aspectRatio(contentMode: .fit)
                            //                        .frame(maxWidth: 40, maxHeight: 40)
                            //                        .background(.white)
                        default:
                            //                    let _ = Logger.info(description: "erorr during caching")
                            let _ = print("error during caching")
                            Color.clear
                                .frame(maxWidth: 40, maxHeight: 40)
                        }
                    }
                VStack(alignment:.leading){
                    HStack{
                        NjNarutoText.shared.getHeadlineText(inputString: "Name: ", withSize: 16)
                        NjNarutoText.shared.getH3Text(inputString: charInfo.name, withSize: 14)
                        Spacer()
                    }
                    .padding(.leading,5)
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
                    HStack{
                        NjNarutoText.shared.getHeadlineText(inputString: "Dob: ", withSize: 16)
                        NjNarutoText.shared.getH3Text(inputString: charInfo.personal.birthdate ?? "", withSize: 14)
                        Spacer()
                    }
                    .padding(.leading,5)
                    HStack{
                        NjNarutoText.shared.getHeadlineText(inputString: "Nature Type: ", withSize: 16)
                        NjNarutoText.shared.getH3Text(inputString: charInfo.natureType?.joined(separator: ",") ?? "", withSize: 14)
                        Spacer()
                    }
                    .padding(.leading,5)
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
                    Spacer()
                    
                }
                .frame(width:350)
                .background(Color.color("#e5dce6"))
                .cornerRadius(8)
                .shadow(radius: 8)
                .offset(y:-50)
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

